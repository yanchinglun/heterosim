#include "bs.c"
int main()
{
    struct DATA data[16] = {
             {1, 100},
	     {5,200},
	     {6, 300},
	     {7, 700},
	     {8, 900},
	     {9, 250},
	     {10, 400},
	     {11, 600},
	     {12, 800},
	     {13, 1500},
	     {14, 1200},
	     {15, 110},
	     {16, 140},
	     {17, 133},
	     {18, 10},
             {8,0}
              };
	int r, re,size0,size1;


        size0 = 124; size1 =4;
                *((volatile unsigned int *)0xf000f008) = (unsigned int)(data);
     *((volatile unsigned int *)0xf000f00C) = 124;  
        r = binary_search(data,size0,&re,size1);
	printf ("Search Result is %d\n", re);
	return 0;	
}
