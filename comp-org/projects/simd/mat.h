#ifndef _MAT_H_
#define _MAT_H_

typedef float **mat4x4; // This needs allocation!!!
typedef float v4sf __attribute__((mode(V4SF)));

union v4 
{
	v4sf v;
	float f[4];
};

// Multiply 2 4x4 matrices, and store the result in res
void mult4x4(mat4x4 res, mat4x4 a, mat4x4 b);

// Multiply 2 4x4 matrices, and store the result in res
void mult4x4SIMD(mat4x4 res, mat4x4 a, mat4x4 b);

// Return a random 4x4 matrix
mat4x4 create4x4(void);

// Return a clear 4x4 matrix (zero'ed out)
mat4x4 create4x4Clear(void);

// Helper function to print matrices
void print4x4(mat4x4 m);

/**********************************************/
/* This part is for the huge 4x4 matrix array */


// Return an array of 4x4 matrices(random), for multiplication.
mat4x4 *create4x4Array(int size);

// Create big cleared array
mat4x4 *create4x4ClearArray(int size);

// Multiply the two massive mat arrays!
void multBigMat(mat4x4 *res, int size, mat4x4 *a, mat4x4 *b);

// Multiply the two massive mats using SIMD!
void multBigMatSIMD(mat4x4 *res, int size, mat4x4 *a, mat4x4 *b);

// Some timer function

double microsecs(void);            // Returns the current time.
	
#endif
