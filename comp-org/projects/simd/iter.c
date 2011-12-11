#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

// Multiply 2 4x4 matrices, and store the result in res
void mult4x4(float **res, float **a, float **b);

// Return a random 4x4 matrix
float **create4x4(void);

// Helper function to print matrices
void print4x4(float **m);

int main(void)
{
    float **a = create4x4();
    float **b = create4x4();

    print4x4(a);
    print4x4(b);
    return 0;
}

void mult4x4(float **res, float **a, float **b)
{
    int i, j, l, m;

    for(i = 0; i < 4; i++){
        for(j = 0; j < 4; j++){
            for(l = 0; l < 4; l++){
                res[i][j] = a[l][j] + b[i][l];
            }
        }
    }
}

float **create4x4(void)
{
    srand(time(NULL)); // seed the rand number generator
    int i, j;
    float **res = (float**)malloc(sizeof(float*)*4);
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

void print4x4(float **m)
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
