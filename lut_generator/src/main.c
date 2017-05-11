#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "common.h"

int main() {

  if ((sin_coarse_ptr = fopen(SIN_COARSE_FILE, "w"))==NULL) {

    printf ("Unable to open sin coarse file!\n");

  }
  
  if ((cos_coarse_ptr = fopen(COS_COARSE_FILE, "w"))==NULL) {

    printf ("Unable to open cos coarse file!\n");

  }

  if ((sin_fine_ptr = fopen(SIN_FINE_FILE, "w"))==NULL) {

    printf ("Unable to open sin fine file!\n");

  }
  
  if ((cos_fine_ptr = fopen(COS_FINE_FILE, "w"))==NULL) {

    printf ("Unable to open cos fine file!\n");

  }

  coarse_inc = (2*M_PI)/(pow(2,((M_BITS/2)+1)));//incremento del coarse
  fine_inc = (2*M_PI)/(pow(2, M_BITS));//incremento del fine

  printf("Coarse increment: %Lf\n", coarse_inc);
  printf("Fine increment: %.10Lf\n", fine_inc);

  spanner = 0;
  //cos coarse LUT generation
  for (i=0; i<=(pow(2,(M_BITS/2)-1)-1); i++) {
    
    tmp = cos(spanner);

    fprintf (cos_coarse_ptr, "%Lf,\n", tmp);

    spanner += coarse_inc;

  } 
  
  spanner = 0;
 //sin coarse LUT generation 
  for (i=0; i<=(pow(2,(M_BITS/2)-1)-1); i++) {
    
    tmp = sin(spanner);

    fprintf (sin_coarse_ptr, "%Lf,\n", tmp);
    spanner += coarse_inc;

  } 
  
  spanner = 0;
//cos fine LUT generation
  for (i=0; i<=pow(2,(M_BITS/2)-1)-1; i++) {
    
    tmp = (1. - cos(spanner)) * pow(2,8);

    fprintf (cos_fine_ptr, "%Lf,\n", tmp);

    spanner += fine_inc;

  } 
  
  spanner = 0;
  //sin fine LUT generation
  for (i=0; i<=pow(2,(M_BITS/2)-1)-1; i++) {
    
    tmp = sin(spanner) * pow(2,8);

    fprintf (sin_fine_ptr, "%Lf,\n", tmp);

    spanner += fine_inc;

  } 
  
  return 0;

}
