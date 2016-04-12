// DESCRIPTION: Verilator Example: Top level main for invoking model
//
// Copyright 2003-2015 by Wilson Snyder. This program is free software; you can
// redistribute it and/or modify it under the terms of either the GNU
// Lesser General Public License Version 3 or the Perl Artistic License
// Version 2.0.

#include <verilated.h>		// Defines common routines
#include "Vsort.h"		// From Verilating "top.v"
#if VM_TRACE
# include <verilated_vcd_c.h>	// Trace file format header
#endif

#include <stdio.h>
#define ARRAY_SIZE 20
#define KERNEL_NAME "sort"

Vsort *top;			// Instantiation of module

vluint64_t main_time = 0;	// Current simulation time (64-bit unsigned)

double sc_time_stamp () {	// Called by $time in Verilog
	return main_time;		// Note does conversion to real, to match SystemC
}

int main(int argc, char **argv, char **env) {
	FILE *input;
	FILE *output;
	if (argc < 3)
	{
		VL_PRINTF("Invoking of %s kernel requires at least 2 arguments\n", KERNEL_NAME);
		exit(1);
	}
	input = fopen(argv[1], "r");
	output = fopen(argv[2], "w");

	char line[256];
	int i = 0;
	unsigned int array_size;

	unsigned int array[ARRAY_SIZE];
	while (fgets(line, sizeof(line), input))
	{
		 if (i < ARRAY_SIZE) {
			sscanf(line, "%llx", &array[i]);
		}
                 else if (i == ARRAY_SIZE) {
			sscanf(line, "%llx", &array_size);
		}   
                 else {
			printf("Invalid input for %s, please check\n", KERNEL_NAME);
			exit(1);
		}
		i++;
	}

	printf("Sorting Array of size %d:", array_size);
	for (i = 0; i < array_size; ++i) {
		printf("%d ", array[i]);
	}
	printf("\n");

	if (0 && env) {}	// Prevent unused variable warnings	// Prevent unused variable warnings
	top = new Vsort;		// Create instance of module

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

	top->n = array_size;
	top->arr_address0 = 0;
	top->arr_address1 = 0;


        unsigned char arr_address0;
        unsigned char arr_ce0=0;
        unsigned char arr_we0;
        unsigned int arr_d0;
        unsigned int arr_q0;
        unsigned char arr_address1;
        unsigned char arr_ce1=0;
        unsigned char arr_we1;
        unsigned int arr_d1;
        unsigned int arr_q1;

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
		if (arr_ce0 == 1 && !arr_we0)
			{top->arr_q0 = array[arr_address0];
                         }
		if (arr_ce0 == 1 && arr_we0)
			{array[arr_address0]= arr_d0;
                        }
      		if (arr_ce1 == 1 && !arr_we1)
			{top->arr_q1 = array[arr_address1];
                         }
		if (arr_ce1 == 1 && arr_we1)
			{array[arr_address1]= arr_d1;
                         }
           }        

                 if(!top->ap_clk)

	        {
                      arr_address0 = top->arr_address0;
                     arr_ce0  =top->arr_ce0;
                    arr_we0 =top->arr_we0;
                    arr_d0 =top->arr_d0;

                        arr_address1 = top->arr_address1;
                     arr_ce1 =top->arr_ce1;
                    arr_we1 =top->arr_we1;
                    arr_d1 =top->arr_d1;

                 } 



		// Read outputs
		/*VL_PRINTF ("[%" VL_PRI64 "d] %x %x %x %d %d %d\n",
		           main_time, top->ap_clk, top->ap_done, top->arr_d0,
		           top->arr_q0, top->arr_d1, top->arr_q1);*/

		top->ap_clk = !top->ap_clk;
		main_time++;		// Time passes...
	}

      	        if (top->arr_ce0 == 1 && top->arr_we0)
			{array[top->arr_address0]= top->arr_d0;
                       }
		if (top->arr_ce1 == 1 && top->arr_we1)
			{array[top->arr_address1]= top->arr_d1;
                       }


       
	top->final();

#if VM_TRACE
	if (tfp) tfp->close();
#endif

	if (!top->ap_done) {
		VL_PRINTF ("A Test failed\n");
		abort();
	} else {
		VL_PRINTF ("%s finished in %d cycles\n", KERNEL_NAME, (main_time - 10)/2);
		fprintf(output, "%d\n", (main_time - 10)/2);
		printf("Sorted array:");
		for (i = 0; i < ARRAY_SIZE; ++i) {
			printf("%d ", array[i]);
			fprintf(output, "%llx\n", array[i]);
		}
		printf("\n");
	}

	fclose(output);

	exit(0L);
}
