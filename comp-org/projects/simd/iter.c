#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

typedef float **mat4x4;

// Multiply 2 4x4 matrices, and store the result in res
void mult4x4(mat4x4 res, mat4x4 a, mat4x4 b);

// Return a random 4x4 matrix

mat4x4 create4x4(void);

// Return a clear 4x4 matrix (zero'ed out)
mat4x4 create4x4Clear(void);

// Helper function to print matrices
void print4x4(mat4x4 m);

int main(void)
{
    
    srand(time(NULL)); // seed the rand number generator
    mat4x4 a = create4x4();
    mat4x4 b = create4x4();
    mat4x4 res = create4x4Clear();
    
    print4x4(a);
    print4x4(b);
    mult4x4(res, a, b);
    print4x4(res);

    return 0;
}

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

mat4x4 create4x4(void)
{
    int i, j;
    mat4x4 res = (mat4x4)malloc(sizeof(float*)*4);
    for(i = 0; i < 4; i++){
        res[i] = (float*)malloc(sizeof(float)*4);
    }
    for(i = 0; i < 4; i++){
        for(j = 0; j < 4; j++){
            res[i][j] = (float)(rand() % 100);
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
