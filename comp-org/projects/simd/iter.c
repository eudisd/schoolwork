#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#include "mat.h" // Includes all matrix operations functions

const int ARRAY_SIZE = 6; // 4*4*16000 elements!

int main(void)
{
    
    srand(time(NULL)); // seed the rand number generator
	
	mat4x4 *bigMatA = create4x4Array(ARRAY_SIZE); 
	mat4x4 *bigMatB = create4x4Array(ARRAY_SIZE); 	
	mat4x4 *bigMatRes = create4x4ClearArray(ARRAY_SIZE);
	print4x4(bigMatA[0]);
	int i;
	//for(i = 0; i < 6; i++)
	//	print4x4(bigMatA[i]);
	//multBigMat(bigMatRes, ARRAY_SIZE, bigMatA, bigMatB);
	
    return 0;
}


