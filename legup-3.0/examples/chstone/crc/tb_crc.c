#include "crc.h"
#include "crc.c"
int main()
{ 
  unsigned char lin[268] = "asdffeagewaHAFEFaeDsFEawFdsFaefaeerdjgp";
  unsigned short *crc;
  short *jinit;
  unsigned int *len;
  int *jrev;
  crc = (unsigned short*)(&lin[256]);
  jinit = (short *)(&lin[258]);
  len = (unsigned int *)(&lin[260]);
  jrev = (int *)(&lin[264]);
  unsigned short buff[2];
  unsigned short i1,i2;
  unsigned int n;
  int x,y;int a;
  x = 268; y= 4;
  n=40;
  lin[n+1]=0;
  *crc = 0;
  *len = n;
  *jinit = 0;
  *jrev = 1;
  int i;
 // for(i=0;i<256;i++)
 // printf("%x ",lin[i]);
 // printf("\n");  
 // printf("%x\n", *(unsigned short*)(&lin[256]));
 // printf("%x\n", * (short *)(&lin[258]));
 // printf("%x\n", *(unsigned int *)(&lin[260]));
 // printf("%x\n", *(int *)(&lin[264])); 
    //   *((volatile unsigned int *)0xf000f008) = (unsigned int)(lin);
    //   *((volatile unsigned int *)0xf000f00C) = 268;  
  a=icrc(lin,x,buff,y);
  i1 = buff[0];
//  printf("%x\n",i1); 
//  printf("lin = %hhu\n", lin);
  printf("------------RESULT-----------\n");
  printf("X-Modem String CRC = %hu\n", i1);
  lin[n+1]=HIBYTE(i1);
  lin[n+2]=LOBYTE(i1);
//  printf("lin = %hhu\n", lin);
  *crc = i1; *len = n+2; //*jinit = 0; *jrev = 1;
    //   *((volatile unsigned int *)0xf000f008) = (unsigned int)(lin);
    //   *((volatile unsigned int *)0xf000f00C) = 268;  
  a=icrc(lin,x,buff,y);
  i2 = buff[0];
  printf("X-Modem Packet CRC = %hu\n", i2);
  printf("-------------------------");
  return 0;
}
