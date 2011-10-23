#include <iostream>
#include <fstream>
#include <cmath>
#include <cassert>
#include <GL/glut.h>

#include "fcts.h"

using namespace std;

int W, H, Margin;
GLuint TexId1, TexId2;

int readPPM(char*, int&, int&, unsigned char *&);

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// init:
//
// Initialization routine before display loop.
//
void init(void)
{
	//glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
	glColor3f    (1.0, 1.0, 1.0);
	glClearColor (0.0, 0.0, 0.0, 1.0);

	// init global vars
	W = 0;
	H = 0;
	Margin = 40;

	// read first texture that will map onto first page
	int ww, hh;
	unsigned char *texData, *texData2;
	readPPM("page1.ppm", ww, hh, texData);

	// init texture parameters
	glGenTextures  (1,&TexId1);
	glBindTexture  (GL_TEXTURE_2D, TexId1);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexImage2D   (GL_TEXTURE_2D, 0, 3, ww, hh, 0, GL_RGB,
			GL_UNSIGNED_BYTE, texData);

	// read second texture that will map onto second page
	readPPM("page2.ppm", ww, hh, texData2);
	
	// init texture parameters
	glGenTextures  (1,&TexId2);
	glBindTexture  (GL_TEXTURE_2D, TexId2);

	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);

	glTexImage2D   (GL_TEXTURE_2D, 0, 3, ww, hh, 0, GL_RGB,
			GL_UNSIGNED_BYTE, texData2); 
	
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// display:
//
// Display handler routine.
//
void display(void)
{
	// clear color and depth buffer to background values
	glClear(GL_COLOR_BUFFER_BIT);

	// enable texture mapping and bind first image to page
	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, TexId1);

	// draw page outline
	glColor3f(1.0, 1.0, 1.0);
	glBegin(GL_POLYGON);
		glTexCoord2f(0, 0);	glVertex2i(  Margin,   Margin);
		glTexCoord2f(0, 1);	glVertex2i(  Margin, H-Margin);
		glTexCoord2f(1, 1);	glVertex2i(W-Margin, H-Margin);
		glTexCoord2f(1, 0);	glVertex2i(W-Margin,   Margin);
	glEnd();
	
	// disable texture mapping
	glDisable(GL_TEXTURE_2D);

	// flush display
	glutSwapBuffers();	
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// readPPM:
//
// Read a PPM file.
// Pass back dimensions and image pointer in width, height, and image.
// Return 1 for success, or 0 for failure.
//
int readPPM(char *file, int &width, int &height, unsigned char* &image)
{
	// open binary file for reading
	ifstream inFile(file, ios::binary);
	assert(inFile);

	// verify that the image is in PPM format
	// error checking: first two bytes must be code for a raw PPM file
	char buf[80];
	inFile.getline(buf, 3);
	if(strncmp(buf, "P6", 2)) {
		cerr << "The file " << file << " is not in PPM format)\n";
		inFile.close();
		return 0;
	}

	// read width, height, and maximum gray val
	int maxGray;
	inFile >> width >> height >> maxGray;

	// skip over linefeed and carriage return
	inFile.getline(buf, 2);

	// allocate image
	image = new unsigned char[width*height*3];
	assert(image);

	// read entire image data
	inFile.read((char*) image, width*height*3);
	inFile.close();
	return 1;
}
