#include <fstream>
#include <iostream>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include "cache_sim_utils.h"

// CACHE_SIZE in number of kilobytes
#define CACHE_SIZE_ 8
// number of bytes per cache line
#define LINE_SIZE_ 16
// number of cycles for an entire fetch using the default 16B line size
// this value should include the cycles taken to load the 4 words (16B) from memory
#define DEFAULT_FETCH_CYCLES 31 
// number of cycles to fetch 1 word from memory (SDRAM = 2, DDR2 = 1)
#define CYCLES_PER_WORD_FETCHED 2
using namespace std;

/*
    specify file with memory access addresses:
    -file <filename>

    specify cache size. Default = 8KB.
    -cachesize <kilobytes>

    specify line size. Default = 16 bytes
    -linesize <bytes>

    specify ways/set. Default = 1 (direct mapped).
    -ways <num>

    specify replacement policy. Default = LRU.
    for direct mapped caches, this argument is irrelavent.
    -replacementpolicy <policy>
        options: LRU, NMRU (random but not MRU), random

    specify how many lines of cache ahead to prefetch. Default = 0. Prefetches on misses.
    -prefetch <num>
    
    append the result to a csv file
    -savecsv <csv filename>

    turn on quiet mode (no warning messages)
    -q
*/

int main(int argc,char* argv[]){

    cout<<"########### CACHE SIMULATOR ###########"<<endl;

    if (argc < 3){
        cout<<"Parser: Error: Too few arguments."<<endl;
        return -1;
    }
    srand ( time(NULL) );

    /// GET INPUTS
    int CACHE_SIZE = get_cache_size(argc,argv);
    int LINE_SIZE = get_line_size(argc,argv);
    int WAYS = get_ways_per_set(argc,argv);
    int PREFETCH = get_prefetch(argc,argv);
    bool quietmode = get_quietmode(argc,argv);
    //bool sweepmode = get_sweepmode(argc,argv);
    string savefile_name;
    bool savingcsv = get_savefile(argc,argv,&savefile_name);
    string file_name;
    if (get_file_name(argc,argv,&file_name) < 0) return -1;
    string replacement_policy;
    if (get_replacement_policy(argc,argv,&replacement_policy) < 0) return -1;

    if (savingcsv == true){
        // Open file to save to
        ofstream outputFile;
        outputFile.open(savefile_name.c_str(),ios_base::app);

        //outputFile<<"Cache size (KB),Line size (B),Ways,Replacement Policy,Prefetch,Hits,Misses,Filename:"<<file_name<<endl;

        outputFile.close();
    }

    /// Check if this is a valid configuration
    if (LINE_SIZE > CACHE_SIZE*1024 ||
        LINE_SIZE*WAYS > CACHE_SIZE*1024){
        cout<<"INVALID cache configuration"<<endl;
        return -1;
    }

    /// Calculate some necessary values
    // Number of sets.
    unsigned int numSets = CACHE_SIZE*1024/LINE_SIZE/WAYS;
    // Calculate number of bits for tag,set,offset.
    int numOffsetBits = 0, numSetBits = 0, numTagBits = 0;
    int temp = LINE_SIZE;
    while (temp != 1){
        temp = temp/2;
        numOffsetBits++;
    }
    temp = numSets;
    while (temp != 1){
        temp = temp/2;
        numSetBits++;
    }
    numTagBits = 32 - numSetBits - numOffsetBits;

    cout<<numTagBits<<"tag, "<<numSetBits<<"setbits, "<<numOffsetBits<<"offset bits."<<endl;
    cout<<numSets<<"sets. "<<endl;
    cout<<WAYS<<"ways"<<endl;

    /// THE CACHE. (ARRAY OF SETS)
    //cache_set cache[numSets];
    cache_set* cache = new cache_set[numSets];


    for (unsigned int i = 0; i < numSets; i++){
        for (int j = 0; j < WAYS; j++)
            cache[i].valid_bits[j] = false;
    }


    // Open up the file containing the addresses
    ifstream inputFile;
    inputFile.open(file_name.c_str());

    // get each address, line by line
    cout<<"SIMULATING..."<<endl;
    char lineFromFile[25];
    unsigned int address, set, tag, hits = 0, misses = 0, fileLine = 0;
    unsigned acel_hits = 0, acel_misses = 0, acel_ld_cycles = -1;
    bool in_accelerator = false;
    while (inputFile.eof()!= true){
        fileLine++;
        inputFile.getline(lineFromFile,25);
        if (strcmp(lineFromFile, "<Accelerator Started>") == 0){
            acel_ld_cycles = 0;
            in_accelerator = true;
            continue;
        }
	else if (strcmp(lineFromFile, "<Accelerator Finished>") == 0){
            in_accelerator = false;
            continue;
        }
        else if (strlen(lineFromFile) != 8){
            if (quietmode == false) cout<<"WARNING: detected address that isn't 32bits. Line: "<<fileLine<<" - "<<lineFromFile<<endl;
            continue;

        }
        address = hexStrToInt(lineFromFile);
        set = (address>>numOffsetBits)&(numSets-1);
        tag  = (address>>(numOffsetBits+numSetBits))&((int)pow(2,numTagBits)-1);

        /// Now that we have the set, go through all the ways in the set and check for hit/miss
        int wayIndex = 0;
        bool hit = false;
        for (wayIndex = 0; wayIndex < WAYS; wayIndex++){
            if (cache[set].ways[wayIndex] == tag && cache[set].valid_bits[wayIndex] == true){
                hit = true;
                break;
            }
        }
        if (hit == true) {
            hits++;
            if (in_accelerator) acel_hits++;
        }
        else {
            misses++;
            if (in_accelerator) acel_misses++;
        }

        /// Now update the cache based on replacement policy.
        if (replacement_policy == "LRU"){
            // MISS
            if (hit == false){

                // shift the entire array by 1. The LRU tag will be deleted.
                for (int j = WAYS -1; j > 0; j--){
                    cache[set].ways[j] = cache[set].ways[j-1];
                    cache[set].valid_bits[j] = cache[set].valid_bits[j-1];
                }
                cache[set].ways[0] = tag;
                cache[set].valid_bits[0] = true;

                /// PREFETCHING
                for (int i = 0; i < PREFETCH; i++){
                    address = address + (int) pow(2,numOffsetBits);
                    set = (address>>numOffsetBits)&(numSets-1);
                    tag  = (address>>(numOffsetBits+numSetBits))&((int)pow(2,numTagBits)-1);

                    //for (int j = WAYS -1; j > 0; j--){
                    //    cache[set].ways[j] = cache[set].ways[j-1];
                    //    cache[set].valid_bits[j] = cache[set].valid_bits[j-1];
                    //}
                    cache[set].ways[0] = tag;
                    cache[set].valid_bits[0] = true;
                }

            // HIT
            } else if (hit == true) {
                // Shift over one until the just accessed element
                for (int j = wayIndex; j > 0; j--)
                    cache[set].ways[j] = cache[set].ways[j - 1];
                // Put the just accessed element into index 0 (MRU).
                cache[set].ways[0] = tag;
/*
                /// Prefetching
                int setoffset = 0, linestogo = PREFETCH;
                while (linestogo > 0){
                    linestogo--;
                    setoffset++;
                    if (set+setoffset < numSets){
                        for (int j = WAYS-1; j > 0; j--){
                            cache[set+setoffset].ways[j] = cache[set+setoffset].ways[j - 1];
                            cache[set+setoffset].valid_bits[j] = cache[set+setoffset].valid_bits[j - 1];
                        }
                        cache[set+setoffset].ways[0] = tag;
                        cache[set+setoffset].valid_bits[0] = true;
                    }else{
                        break;
                    }
                }
*/
            }
        }
        if (replacement_policy == "random"){
            if (hit == false){
                int ran = rand()%WAYS;
                cache[set].ways[ran] = tag;
                cache[set].valid_bits[ran] = true;
            }
        }
        if (replacement_policy == "NMRU"){
            if (hit == false){
                int ran = 0;
                while (ran == 0) ran = rand()%WAYS;
                cache[set].ways[ran] = cache[set].ways[0];
                cache[set].valid_bits[ran] = true;
                cache[set].ways[0] = tag;
                cache[set].valid_bits[0] = true;
            } else if (hit == true) {
                unsigned int MRUtag = cache[set].ways[wayIndex];
                // Shift over one until the just accessed element
                for (int j = wayIndex; j > 0; j--){
                    cache[set].ways[j] = cache[set].ways[j - 1];
                    cache[set].valid_bits[j] = cache[set].valid_bits[j-1];
                }
                // Put the just accessed element into index 0 (MRU).
                cache[set].ways[0] = MRUtag;
                cache[set].valid_bits[0] = true;
            }
        }
    }
    int extraWordsToFetch = LINE_SIZE/4 - 4;
    int cycleEstimate = misses*(DEFAULT_FETCH_CYCLES + CYCLES_PER_WORD_FETCHED*extraWordsToFetch);
    cout<<CACHE_SIZE<<"KB CACHE, "<<LINE_SIZE<<" BYTES LINE SIZE: "<<hits<<"HITS, "<<misses<<" MISSES. "<<cycleEstimate<<" FETCH CYCLES."<<endl;
    if (savingcsv == true){
        // Open file to save to
        ofstream outputFile;
        outputFile.open(savefile_name.c_str(),ios_base::app);

        outputFile<<CACHE_SIZE<<","<<LINE_SIZE<<","<<WAYS<<","<<replacement_policy<<","<<PREFETCH<<","<<hits<<","<<misses<<","<<cycleEstimate<<endl;

        outputFile.close();
    }




    inputFile.close();
    //if (savingcsv == true) outputFile.close();
    if (acel_ld_cycles == 0) { // means that there is <Accelerator Started> in inputFile
        acel_ld_cycles = acel_hits + acel_misses*(DEFAULT_FETCH_CYCLES + CYCLES_PER_WORD_FETCHED*extraWordsToFetch);
        cout<<"Accelerator - Cache Accesses: "<<acel_hits<<" HITS, "<<acel_misses<<" MISSES."<<endl;
        cout<<"Accelerator - Estimated Cycles: "<<acel_ld_cycles<<endl;
    }
    return 0;
}

/*
int main(int argc,char* argv[]){

    cout<<"### CACHE SIMULATOR ###"<<endl;

    if (argc < 2){
        cout<<"Parser: Error: Too few arguments."<<endl;
        return -1;
    }

    /// GET INPUTS
    int CACHE_SIZE = get_cache_size(argc,argv);
    int LINE_SIZE = get_line_size(argc,argv);
    string file_name;
    if (get_file_name(argc,argv,&file_name) < 0) return -1;
    int i;

    // Number of lines in the cache.
    int numLines = CACHE_SIZE*1024/LINE_SIZE;

    // Get number of offset bits
    int numOffsetBits = 0, numLineBits = 0, numTagBits = 0;
    int temp = LINE_SIZE;
    while (temp != 1){
        temp = temp/2;
        numOffsetBits++;
    }
    // Get number of line index bits
    temp = numLines;
    while (temp != 1){
        temp = temp/2;
        numLineBits++;
    }
    // Get number of tag bits
    numTagBits = 32 - numLineBits - numOffsetBits;

    /// ARRAY OF SETS
    unsigned int cache[numLines];
    for (i = 0;i<numLines;i++) cache[i] = 0;
    /// ARRAY OF VALID BITS
    bool valid_bits[numLines];
    for (i = 0;i<numLines;i++) valid_bits[i] = false;

    // Open up the file containing addresses
    ifstream inputFile;
    inputFile.open(file_name.c_str());

    // get each address, line by line
    char lineFromFile[10];
    unsigned int address, line, tag, hits = 0, misses = 0, fileLine = 0;
    while (inputFile.eof()!= true){
        fileLine++;
        inputFile.getline(lineFromFile,10);
        if (strlen(lineFromFile) != 8){
            cout<<"WARNING: detected address not 32bits. Ignoring this access. Line: "<<fileLine<<endl;
            continue;

        }
        address = hexStrToInt(lineFromFile);
        line = (address>>numOffsetBits)&(numLines-1);
        tag  = (address>>(numOffsetBits+numLineBits))&((int)pow(2,numTagBits)-1);

        if (cache[line] == tag) hits++;
        else{
            misses++;
            cache[line] = tag;
        }


    }
    cout<<LINE_SIZE<<" BYTES LINE SIZE, "<<CACHE_SIZE<<"KB CACHE: "<<hits<<"HITS, "<<misses<<" MISSES."<<endl;
    inputFile.close();

    return 0;
}
*/
