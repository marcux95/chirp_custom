#include <stdio.h>
#include <stdlib.h>

#define SIN_COARSE_FILE "sin_coarse_lut.txt"
#define COS_COARSE_FILE "cos_coarse_lut.txt"
#define SIN_FINE_FILE "sin_fine_lut.txt"
#define COS_FINE_FILE "cos_fine_lut.txt"
#define M_BITS 16 //Total bits
#define F_BITS 9 // coarse bits
#define I_BITS 7 // fine bits

FILE *sin_coarse_ptr, *cos_coarse_ptr;
FILE *sin_fine_ptr, *cos_fine_ptr;

long double coarse_inc;
long double fine_inc;
long double spanner, tmp;
int i;
