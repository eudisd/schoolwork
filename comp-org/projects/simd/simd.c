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
/*
    union v4 a, b, c;
    a.f[0] = 1; a.f[1] = 1; a.f[2]=2;a.f[3]=2;
    b.f[0] = 1; b.f[1] = 0; b.f[2]=2;b.f[3]=3;
    c.v = a.v * b.v;
    printf("%f %f %f %f\n", c.f[0], c.f[1], c.f[2], c.f[3]);
 */   return 0;
}


