// DESCRIPTION: Verilator Example: Top level main for invoking model
//
// Copyright 2003-2015 by Wilson Snyder. This program is free software; you can
// redistribute it and/or modify it under the terms of either the GNU
// Lesser General Public License Version 3 or the Perl Artistic License
// Version 2.0.

#include <verilated.h>		// Defines common routines
#include "Vicrc.h"		// From Verilating "top.v"
#if VM_TRACE
# include <verilated_vcd_c.h>	// Trace file format header
#endif

#include <stdio.h>
#define ARRAY_SIZE 2
#define array_size 1
#define KERNEL_NAME "icrc"

Vicrc *top;			// Instantiation of module

vluint64_t main_time = 0;	// Current simulation time (64-bit unsigned)

double sc_time_stamp () {	// Called by $time in Verilog
	return main_time;		// Note does conversion to real, to match SystemC
}

int main(int argc, char **argv, char **env) {
	FILE *input;
	FILE *output;
        FILE *ss;
	if (argc < 3)
	{
		VL_PRINTF("Invoking of %s kernel requires at least 2 arguments\n", KERNEL_NAME);
		exit(1);
	}
	input = fopen(argv[1], "r");
	output = fopen(argv[2], "w");
        ss = fopen("show.txt","w");
	char line[256];
	int i = 0;

        //unsigned short crc; 
        //unsigned int len;
        //unsigned short jinit; 
        //unsigned int jrev; 
        unsigned char lin[268];
        unsigned short buff;
        unsigned char buff_ap_vld; 
        unsigned char lin_ce0;
        unsigned short lin_address0;
        unsigned char lin_q0;
        unsigned char lin_ce1;
        unsigned short lin_address1;
        unsigned char lin_q1;
                

   

	while (fgets(line, sizeof(line), input))
	{
		if (i < 268)  sscanf(line, "%x", &lin[i]);
		//else if(i<257) sscanf(line, "%x", &crc);
                //else if(i<258) sscanf(line, "%x", &jinit);
                //else if(i<259) sscanf(line, "%x", &len);
                //else if(i<260) sscanf(line, "%x", &jrev);
                else {
			printf("Invalid input for %s, please check\n", KERNEL_NAME);
			exit(1);
		}
		i++;
	}

	//printf("Input:");
	//for (i = 0; i < 268; i++) {
	//	printf("%x ", lin[i]);
	//}
	//printf("\n");
        //printf ("%d,%d,%d,%d\n", crc, jinit, len, jrev);
        
	if (0 && env) {}	// Prevent unused variable warnings	// Prevent unused variable warnings
	top = new Vicrc;		// Create instance of module

	Verilated::commandArgs(argc, argv);
	Verilated::debug(0);

#if VM_TRACE			// If verilator was invoked with --trace
	Verilated::traceEverOn(true);	// Verilator must compute traced signals
	VL_PRINTF("Enabling waves...\n");
	VerilatedVcdC* tfp = new VerilatedVcdC;
	top->trace (tfp, 99);	// Trace 99 levels of hierarchy
	tfp->open ("vlt_dump.vcd");	// Open the dump file
#endif

	top->ap_clk = 0;		// Set some inputs
	top->ap_rst = 1;
	top->ap_start = 0;
        top->x = 268;
        top->y = 4;
        //top->jinit = jinit;
        //top->jrev = jrev; 



	while (!top->ap_done && !Verilated::gotFinish()) {

		if (main_time > 10) {
			top->ap_rst = 0;
			top->ap_start = 1;	// Deassert reset
		} else if (main_time > 1) {
			top->ap_rst = 1;	// Assert reset
		}

		top->eval();		// Evaluate model
#if VM_TRACE
		if (tfp) tfp->dump (main_time);	// Create waveform trace for this timestamp
#endif
                 if(top->ap_clk)

                {            
                   if ( lin_ce0 == 1 )
                         top->lin_q0 = lin[lin_address0];
                   if ( lin_ce1 == 1 )
                         top->lin_q1 = lin[lin_address1];
                   if( buff_ap_vld = 1)
                         buff = buff;
                }        

                 if(!top->ap_clk)

	        {
                    lin_ce0 = top->lin_ce0;
                    lin_address0 = top->lin_address0;
                    lin_ce1 = top->lin_ce1;
                    lin_address1 = top->lin_address1;
                    buff = top->buff;
                    buff_ap_vld = top->buff_ap_vld; 
                 }


                fprintf(ss,"%d,%x:\n", main_time, top->ap_clk);
                fprintf(ss,"%x,%x,%x\n",top->lin_ce0,top->lin_q0, top->lin_address0);
                fprintf(ss,"%x,%x,%x\n",top->lin_ce1,top->lin_q1, top->lin_address1);
                fprintf(ss,"%x,%x\n",top->buff_ap_vld,top->buff);
		// Read outputs
		/*VL_PRINTF ("[%" VL_PRI64 "d] %x %x %x %d %d %d\n",
		           main_time, top->ap_clk, top->ap_done, top->Array_r_d0,
		           top->Array_r_q0, top->Array_r_d1, top->Array_r_q1);*/

		top->ap_clk = !top->ap_clk;
		main_time++;		// Time passes...
                
            
	}
                
                 if( top->buff_ap_vld = 1)
                         buff = top->buff; 
  
                fprintf(ss,"%x,%x",top->ap_done,top->ap_return);
      

	top->final();

#if VM_TRACE
	if (tfp) tfp->close();
#endif

	if (!top->ap_done) {
		VL_PRINTF ("A Test failed\n");
		abort();
	} else {
		//VL_PRINTF ("%s finished in %d cycles\n", KERNEL_NAME, (main_time - 10)/2);
		//printf("output:");
		fprintf(output, "%d\n", (main_time - 10)/2);
		for (i = 0; i < array_size; i++) {
			//printf("%d ", buff[i]);
			fprintf(output, "%x\n", buff);
		}
		//printf("\n");
	}

	fclose(output);
        fclose(input); 
        fclose (ss);

	exit(0L);
}
