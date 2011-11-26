#include <stdio.h>
#include <stdlib.h>

void printMat(float **matrix, int n, int m);
float **matMultIter(float **m1, 
                 int m1_n,
                 int m1_m, 
                 float **m2,
                 int m2_n,
                 int m2_m);

int main(void){
    int i, j;
    int m1_n = 3, m1_m = 3;
    int m2_n = 3, m2_m = 3;
    
    float **m1 = (float**)malloc(sizeof(float*)*3);  
    float **m2 = (float**)malloc(sizeof(float*)*3);

    for(i = 0; i < m1_m; i++){
        m1[i] = (float*)malloc(sizeof(float)*3); 
        m2[i] = (float*)malloc(sizeof(float)*3);
    }

    m1[0][0] = 0.0; m1[0][1] = 1.0; m1[0][2] = 2.0;
    m1[1][0] = 1.0; m1[1][1] = 0.1; m1[1][2] = 3.0;
    m1[2][0] = 2.0; m1[2][1] = 0.2; m1[2][2] = 4.0;
    
    m2[0][0] = 0.0; m2[0][1] = 1.0; m2[0][2] = 2.0;
    m2[1][0] = 1.0; m2[1][1] = 0.1; m2[1][2] = 3.0;
    m2[2][0] = 2.0; m2[2][1] = 0.2; m2[2][2] = 4.0;

    printf("Printing matrices and result\nMatrix 1:\n");
    printMat(m1, m1_n, m1_m);
    printMat(m2, m2_n, m2_m);
    printf("Matrix1 * Matrix2 = \n");
    printMat(matMultIter(m1, m1_n, m1_m, m2, m2_n, m2_m),
            m1_n, m2_m);
    return EXIT_SUCCESS;
}


void printMat(float **matrix, int n, int m){
    int i, j;
    for(i = 0; i < n; i++){
        printf("|");
        for(j = 0; j < m; j++){
            printf("%f ", matrix[i][j]);
        }
        printf("|\n");
    }
    printf("\n");
}

float **matMultIter(float **m1, 
                   int m1_n,
                   int m1_m,
                   float **m2,
                   int m2_n,
                   int m2_m){
    int i, j, I, J;
    float **res;

    if( m1_m != m2_n || m1_n != m2_m ){
        printf("Error, cannot multiply these matrices!");
    }

    res = (float**)malloc(sizeof(float*)*m1_n);

    for(i = 0; i < m1_n; i++)
        res[i] = (float*)malloc(sizeof(float)*m2_m);

    for(i = 0; i < m1_n; i++)
        for(j = 0; j < m2_m; j++)
            for(I = 0; I < m1_n; I++)
                for(J = 0; J < m2_m; J++) 
                    res[i][j] = m1[I][J] + m2[J][I];
        
    return res;
}
