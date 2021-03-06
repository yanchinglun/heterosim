#include "bitops.h"


 int CDECL bit_shifter(long long * in, int mm, int  * out, int nn)
{
  long long int x =*in;
  int i, n;

  bit_shifter_label0:for (i = n = 0; x && (i < (sizeof(long long) * CHAR_BIT)); ++i, x >>= 1)
    n += (int)(x & 1L);
  *out = n;
  return mm+nn;
}

int bitcnt(long long * in, int mm, int * out, int nn)
{

    bit_count(in, mm, &out[0], nn);
    bitcount(in, mm, &out[1], nn);
    //ntbl_bitcnt(in, mm, &out[2], nn);
    ntbl_bitcount(in, mm, &out[2], nn);
    BW_btbl_bitcount(in, mm, &out[3], nn);
    AR_btbl_bitcount(in, mm, &out[4], nn);
    bit_shifter(in, mm, &out[5], nn);

    return mm+nn;
}
