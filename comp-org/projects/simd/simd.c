#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#include "mat.h" // Includes all matrix operations functions

const int ARRAY_SIZE = 160000; // 4*4*16000 elements!

int main(void)
{
    srand(time(NULL)); // seed the rand number generator
	
	//mat4x4 *bigMatA = create4x4Array(ARRAY_SIZE); 
	//mat4x4 *bigMatB = create4x4Array(ARRAY_SIZE); 	
	//mat4x4 *bigMatRes = create4x4ClearArray(ARRAY_SIZE);
	
	//multBigMatSIMD(bigMatRes, ARRAY_SIZE, bigMatA, bigMatB);
	mat4x4 a = create4x4();
	mat4x4 b = create4x4();
	mat4x4 res = create4x4Clear();
	
	print4x4(a);
	print4x4(b);
	mult4x4SIMD(res, a, b);
	print4x4(res);

    return 0;
}


