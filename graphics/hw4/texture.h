#ifndef _TEXTURE_H_
#define _TEXTURE_H_

/* texture.h - by David Blythe, SGI 
   read_texture is a simplistic routine for reading an SGI .rgb image file. */

#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
#include <GL/glut.h>

// Type definitions
typedef struct _ImageRec {
    unsigned short imagic;
    unsigned short type;
    unsigned short dim;
    unsigned short xsize, ysize, zsize;
    unsigned int min, max;
    unsigned int wasteBytes;
    char name[80];
    unsigned long colorMap;
    FILE *file;
    unsigned char *tmp, *tmpR, *tmpG, *tmpB;
    unsigned long rleEnd;
    unsigned int *rowStart;
    int *rowSize;
} ImageRec;


// Function Prototypes
void bwtorgba(unsigned char *b,unsigned char *l,int n);
void rgbtorgba(unsigned char *r,unsigned char *g,unsigned char *b,unsigned char *l,int n);
void rgbatorgba(unsigned char *r,unsigned char *g,unsigned char *b,unsigned char *a,unsigned char *l,int n);
static void ConvertShort(unsigned short *array, unsigned int length);
static void ConvertUint(unsigned *array, unsigned int length);
static ImageRec *ImageOpen(char *fileName);
static void ImageClose(ImageRec *image);
static void ImageGetRow(ImageRec *image, unsigned char *buf, int y, int z);
unsigned *read_texture(char *name, int *width, int *height, int *components);
void imgLoad(char *filenameIn, int borderIn, GLfloat borderColorIn[4], int *wOut, int *hOut, GLubyte ** imgOut);


#endif 