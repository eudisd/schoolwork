#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#include "mat.h" // Includes all matrix operations functions

const int ARRAY_SIZE = 160000; // 4*4*16000 elements!

int main(void)
{
    srand(time(NULL)); // seed the rand number generator
	
	  mat4x4 *bigMatA = create4x4Array(ARRAY_SIZE); 
    mat4x4 *bigMatB = create4x4Array(ARRAY_SIZE); 	
	  mat4x4 *bigMatRes = create4x4ClearArray(ARRAY_SIZE);
	  multBigMatSIMD(bigMatRes, ARRAY_SIZE, bigMatA, bigMatB);

    return 0;
 
}


