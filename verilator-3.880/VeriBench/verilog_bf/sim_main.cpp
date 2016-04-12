// DESCRIPTION: Verilator Example: Top level main for invoking model
//
// Copyright 2003-2015 by Wilson Snyder. This program is free software; you can
// redistribute it and/or modify it under the terms of either the GNU
// Lesser General Public License Version 3 or the Perl Artistic License
// Version 2.0.

#include <verilated.h>		// Defines common routines
#include "VBF_cfb64_encrypt.h"		// From Verilating "top.v"
#if VM_TRACE
# include <verilated_vcd_c.h>	// Trace file format header
#endif

#include <stdio.h>
#define tsize 4096
#define ARRAY_SIZE tsize*2
#define array_size tsize*2
#define KERNEL_NAME "BF_cfb64_encrypt"

VBF_cfb64_encrypt *top;			// Instantiation of module

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
        ss = fopen("show_delay.txt","w");
	char line[256];
	int i = 0;
        
         unsigned char in[40];
         unsigned char out[40];
         unsigned int length;
         unsigned char ivec[8];
         unsigned int num;
         unsigned int encrypt;
         unsigned int keyp[18];
         unsigned int keys[4 * 256];  

      // for(i=0;i<8;i++)
      //  printf("%x",ivec[i]);
      //  printf("\n"); 
       
	while (fgets(line, sizeof(line), input))
	{      if(i<1)
                  {  sscanf(line, "%x", &length);
                     }  
               else if (i<2)
                 {   sscanf(line, "%x", &encrypt);
                     }     
		else if (i < (2+4*256)) {
			sscanf(line, "%x", &keys[i-2]);
		} else if(i< (2+4*256+18))
                    {   sscanf(line, "%x", &keyp[i-2-1024]);
                     }  
                   else if(i<(2+4*256+18+40))
                     {   sscanf(line, "%x", &in[i-2-1024-18]);
                     }  
                   else if (i<(2+4*256+18+40+1))
                       { sscanf(line, "%x", &num);
                         }   
                    else if(i<(2+4*256+18+40+1+8))
                      {  sscanf(line, "%x", &ivec[i-1044-41]);
                         }           
                      else
                     {
			printf("Invalid input for %s, please check\n", KERNEL_NAME);
			exit(1);
		     }
		     i++;
	}
        //for(i=0;i<8;i++)
        //printf("%x",ivec[i]); 
        //printf("\n");
	/*printf("Input:");
	for (i = 0; i < ARRAY_SIZE; i++) {
		printf("%d ", buff[i]);
	}
	printf("\n");
        */
	if (0 && env) {}	// Prevent unused variable warnings	// Prevent unused variable warnings
	top = new VBF_cfb64_encrypt;		// Create instance of module

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
        top->encrypt = encrypt;
        top->num_i = num; 
        top->length_r = length;

        unsigned char in_r_address0;
        unsigned char in_r_ce0 = 0;
        unsigned char in_r_q0;

        unsigned char out_r_address0;
        unsigned char out_r_ce0 = 0;
        unsigned char out_r_we0;
        unsigned char out_r_d0;


        unsigned char ivec_address0;
        unsigned char ivec_ce0=0;
        unsigned char ivec_we0;
        unsigned char ivec_d0;
        unsigned char ivec_q0;
        unsigned char ivec_address1;
        unsigned char ivec_ce1=0;
        unsigned char ivec_we1;
        unsigned char ivec_d1;
        unsigned char ivec_q1;

        unsigned int num_o;
        unsigned char num_o_ap_vld=0;

        unsigned short key_S_address0;
        unsigned char key_S_ce0=0;
        unsigned int key_S_q0;
        unsigned short key_S_address1;
        unsigned char key_S_ce1=0;
        unsigned int key_S_q1;
        unsigned char key_P_address0;
        unsigned char key_P_ce0=0;
        unsigned int key_P_q0;
        unsigned char key_P_address1;
        unsigned char key_P_ce1;
        unsigned int key_P_q1;

 
 


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
                if ( key_P_ce0 == 1 )
                         top->key_P_q0 = keyp[key_P_address0];

                if ( key_P_ce1 == 1 )
                         top->key_P_q1 = keyp[key_P_address1];
                         
                if ( key_S_ce0 == 1 )
                         top->key_S_q0 = keys[key_S_address0];

                if ( key_S_ce1 == 1 )
                         top->key_S_q1 = keys[key_S_address1];

                if ( num_o_ap_vld == 1 )
                         num = num_o;

		if ( ivec_ce0 == 1 && ivec_we0)
                         ivec[ivec_address0]= ivec_d0;

                if ( ivec_ce1 == 1 && ivec_we1)
                         ivec[ivec_address1]= ivec_d1;
                 
                if ( ivec_ce0 == 1 && !ivec_we0)
                         top->ivec_q0 = ivec[ivec_address0];

                if ( ivec_ce1 == 1 && !ivec_we1)
                         top->ivec_q1 = ivec[ivec_address1];

                if ( out_r_ce0 == 1 && out_r_we0)
                         out[out_r_address0]= out_r_d0;

                if ( in_r_ce0 == 1)
                         top->in_r_q0 = in[in_r_address0] ;

    

  }        

                 if(!top->ap_clk)

	        {
			key_P_address0 = top->key_P_address0;
			key_P_ce0 = top->key_P_ce0;
			key_P_q0= top->key_P_q0;
			key_S_address0= top->key_S_address0;
			key_S_ce0= top->key_S_ce0;
			key_S_q0= top->key_S_q0;
                        key_P_address1 = top->key_P_address1;
			key_P_ce1 = top->key_P_ce1;
			key_P_q1= top->key_P_q1;
			key_S_address1= top->key_S_address1;
			key_S_ce1= top->key_S_ce1;
			key_S_q1= top->key_S_q1;
			ivec_address0= top->ivec_address0;
			ivec_ce0= top->ivec_ce0;
			ivec_we0= top->ivec_we0;
			ivec_d0= top->ivec_d0;
			ivec_q0= top->ivec_q0;
			ivec_address1= top->ivec_address1;
			ivec_ce1= top->ivec_ce1;
			ivec_we1= top->ivec_we1;
			ivec_d1= top->ivec_d1;
			ivec_q1= top->ivec_q1;
			in_r_address0= top->in_r_address0;
			in_r_ce0= top->in_r_ce0;
			in_r_q0= top->in_r_q0;
			out_r_address0= top->out_r_address0;
			out_r_ce0= top->out_r_ce0;
			out_r_we0= top->out_r_we0;
			out_r_d0= top->out_r_d0;
	

                 }

                 //if(top->ivec_we0 | top->ivec_we1 | top->out_r_we0)
                  {fprintf(ss,"%x  %x: \n",top->ap_clk, main_time); 
                  fprintf(ss,"p0: %x, %x, %x\n",top->key_P_address0,top->key_P_q0, top->key_P_ce0);
                  fprintf(ss,"s0: %x, %x, %x\n",top->key_S_address0,top->key_S_q0, top->key_S_ce0); 
                  fprintf(ss,"p1: %x, %x, %x\n",top->key_P_address1,top->key_P_q1, top->key_P_ce1);
                  fprintf(ss,"s1: %x, %x, %x\n",top->key_S_address1,top->key_S_q1, top->key_S_ce1); 
                  fprintf(ss,"in: %x, %x, %x\n",top->in_r_address0, top->in_r_q0,top->in_r_ce0);
                  fprintf(ss,"e0: %x, %x, %x,%x,%x\n",top->ivec_address0,top->ivec_d0, top->ivec_we0,top->ivec_ce0,top->ivec_q0);
                  fprintf(ss,"e1: %x, %x, %x,%x,%x\n",top->ivec_address1,top->ivec_d1, top->ivec_we1,top->ivec_ce1,top->ivec_q1);
                  fprintf(ss,"ou: %x, %x, %x\n",top->out_r_address0, top->out_r_d0,top->out_r_we0);
		}// Read outputs
		/*VL_PRINTF ("[%" VL_PRI64 "d] %x %x %x %d %d %d\n",
		           main_time, top->ap_clk, top->ap_done, top->Array_r_d0,
		           top->Array_r_q0, top->Array_r_d1, top->Array_r_q1);*/

		top->ap_clk = !top->ap_clk;
		main_time++;		// Time passes...
	}

		if ( top->num_o_ap_vld == 1 )
                         num = top->num_o;

		if ( top->ivec_ce0 == 1 && top->ivec_we0)
                         ivec[top->ivec_address0]= top->ivec_d0;

                if ( top->ivec_ce1 == 1 && top->ivec_we1)
                         ivec[top->ivec_address1]= top->ivec_d1;

                if ( top->out_r_ce0 == 1 && top->out_r_we0)
                         out[top->out_r_address0]= top->out_r_d0;

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
                fprintf(output, "%x\n", num);
		for (i = 0; i < 8; i++) {
			//printf("%d ", buf[i]);
			fprintf(output, "%x\n", ivec[i]);
		}
                for (i = 0; i < 40; i++) {
			//printf("%d ", buf[i]);
			fprintf(output, "%x\n", out[i]);
		}  

		//printf("\n");
	}

	fclose(output);
        fclose(input); 
        fclose (ss);

	exit(0L);
}
