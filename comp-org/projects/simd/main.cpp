#include <stdio.h>
#include <stdlib.h>

float **matMultIter(float *m1, 
                 int m1_n,
                 int m1_m, 
                 float *m2,
                 int m2_n,
                 int m2_m);

int main(void){
    int i, j;
    int m1_n = 3, m1_m = 3;
    int m2_n = 3, m2_m = 3;
    float m1[3][3] = {{0.0, 0.1, 1.0},
                      {1.0, 2.0, 3.0},
                      {30.0, 15.0, 1.0}};

    printf("Printing matrices and result\nMatrix 1:\n");
    for(i = 0; i < m1_n; i++){
        printf("|");
        for(j = 0; j < m1_m; j++){
            printf("%f ", m1[i][j]);
        }
        printf("|\n");

    }
    return EXIT_SUCCESS;
}

float **matMultIter(float *m1, 
                   int m1_n,
                   int m1_m,
                   float *m2,
                   int m2_n,
                   int m2_m){
    int i, j;
    float **res;

    if( m1_m != m2_n || m1_n != m2_m ){
        printf("Error, cannot multiply these matrices!");
    }

    res = (float**)malloc(sizeof(float*)*m1_n);

    for(i = 0; i < m1_n; i++)
        res[i] = (float*)malloc(sizeof(float)*m2_m);

    for(i = 0; i < m1_m; i++)
        for(j = 0; j < m2_n; j++){
        }
    return res;
}
