#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>

#include "mat.h"

void mult4x4(mat4x4 res, mat4x4 a, mat4x4 b)
{
    int i, j, l, m;
    
    for(i = 0; i < 4; i++){
        for(j = 0; j < 4; j++){
            for(l = 0; l < 4; l++){
                res[i][j] += (a[i][l] * b[l][j]);
            }
        }
    }
}

void mult4x4SIMD(mat4x4 res, mat4x4 a, mat4x4 b)
{
	union v4 A, B, Res;
	int i, j;
	for(i = 0; i < 4; i++){
		for(j = 0; j < 4; j++){	
			/*if(j == 0){
				A.f[0] = a[i][0];
				A.f[1] = a[i][1];
				A.f[2] = a[i][2];
				A.f[3] = a[i][3];

				B.f[0] = b[0][j];
				B.f[1] = b[1][j];
				B.f[2] = b[2][j];
				B.f[3] = b[3][j];
				Res.v = A.v * B.v;
				res[i][j] = Res.f[0] + Res.f[1] + Res.f[2] + Res.f[2];
			}*/
	  
    }
	}
	
}

mat4x4 create4x4(void)
{
    int i, j;
    mat4x4 res = (mat4x4)malloc(sizeof(float*)*4);
    for(i = 0; i < 4; i++){
        res[i] = (float*)malloc(sizeof(float)*4);
    }
    for(i = 0; i < 4; i++){
        for(j = 0; j < 4; j++){
            res[i][j] = (float)(rand() % 2);
        }
    }
    return res;
}

mat4x4 create4x4Clear(void)
{
    int i, j;
    mat4x4 res = (mat4x4)malloc(sizeof(float*)*4);
    for(i = 0; i < 4; i++){
        res[i] = (float*)malloc(sizeof(float)*4);
    }
    for(i = 0; i < 4; i++){
        for(j = 0; j < 4; j++){
            res[i][j] = 0.0;
        }
    }
    return res;
}

void print4x4(mat4x4 m)
{
    int i, j;
    for(i = 0; i < 4; i++){
        printf("\n|");
        for(j = 0; j < 4; j++){
            printf(" %f ", m[i][j]);
        }
        printf("|\n");
    }
    printf("\n");
}

mat4x4 *create4x4Array(int size)
{
	int i;
	mat4x4 *res = (mat4x4*)malloc(sizeof(mat4x4)*size);
	for(i = 0; i < size; i++)
		res[i] = create4x4();
	return res;
}

mat4x4 *create4x4ClearArray(int size)
{
	int i;
	mat4x4 *res = (mat4x4*)malloc(sizeof(mat4x4)*size);
	for(i = 0; i < size; i++)
		res[i] = create4x4Clear();
	return res;
}

inline void multBigMat(mat4x4 *res, int size, mat4x4 *a, mat4x4 *b)
{
	int i;
	for(i = 0; i < size; i++){
		mult4x4(res[i], a[i], b[i]);
	}
}

inline void multBigMatSIMD(mat4x4 *res, int size, mat4x4 *a, mat4x4 *b)
{
	int i;
	for(i = 0; i < size; i++){
		mult4x4SIMD(res[i], a[i], b[i]);
	}
}

double microsecs(){
    static struct timeval _t;
    static struct timezone tz;
    gettimeofday(&_t, &tz);
    return (double)_t.tv_sec + (double)_t.tv_usec/(1000*1000);
    
}





