/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* tunesGL.cpp: GL code simulating iTunes' coverflow interface.
*
* Written by: George Wolberg, 2008
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

#include <iostream>
#include <fstream>
#include <cmath>
#include <cassert>
#include <cstring>
#include <GL/glut.h>
using namespace std;

// user-defined datatypes
typedef float vector3f[3];
typedef struct {
	int		width;
	int		height;
	GLuint		texId;
	char		imageFilename[512];
} Record;

// global variables
Record  *_records;		// list of records (albums)
int	 _recordCount;		// number of records
float	 _scrollOffset=0;	// -1<offset<1 current scroll position
int	 _scrollDir;		// current scroll velocity
float	 _scrollTime=200;	// total scrolling time (per push)
int	 _scrollUpdateInterval=10;	// scrolling time increment
int	 _bScrolling=0;		// scrolling boolean: 1=true; 0=false

// function prototypes
void initRecords	(int recordCount);
void initGL		();
void display		();
void resize		(int width, int height);
void keyPress		(unsigned char key, int x, int y);
void specialKeyPress	(int key, int x, int y);
void scrollRecords	(int dir);
void scrollTimer	(int value);
void drawRecords	();
void drawRecord		(Record *record);
void quit		();
int  readPPM		(char*, int&, int&, unsigned char *&);



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// main:
//
// Coverflow interface simulation.
//
int main(int argc, char **argv)
{
	// initialize GLUT
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE|GLUT_RGB|GLUT_DEPTH);
	glutInitWindowPosition(0,0);
	glutInitWindowSize(640, 480);
	glutCreateWindow("CoverFlow Simulation");

	// initialize record list
	initRecords(21);

	// initialize OpenGL
	initGL();

	// set keyboard callback function
	glutKeyboardFunc(keyPress);
	glutSpecialFunc (specialKeyPress);

	// set reshape callback funtion
	glutReshapeFunc(resize);

	// set display function
	glutDisplayFunc(display);

	// GLUT main loop
	glutMainLoop();

	return 0;
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// initRecords:
//
// Initialize data structure of records.
// The input is recordCount, which is the number of record albums.
// This number should always be odd for display symmetry.
//
void initRecords(int recordCount)
{
	// init cover art info
	int   albumCount =  11;
	char  imageDir[] = "albumCovers";
	char *imageFilename[] = {
		"beatles.ppm", "dylan.ppm", "crickets.ppm",
		"animals.ppm", "kinks.ppm", "perkins.ppm",
		"stones.ppm", "presley.ppm", "richard.ppm",
		"supremes.ppm", "bluejean.ppm"};

	// init global vars and create space
	_recordCount = recordCount;
	_records = (Record*) malloc(sizeof(Record)*_recordCount);

	// init data structure with dimensions of cover art polygons
	// and filenames for the polygon textures
	for(int i=0; i<_recordCount; i++) {
		// save dimensions
		_records[i].width  = 5;
		_records[i].height = 5;

		// save image filenames
		sprintf(_records[i].imageFilename, "%s/%s", imageDir,
		imageFilename[i % albumCount]);
	}
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// initGL:
//
// GL initialization routine before display loop.
//
void initGL()
{
	glEnable(GL_DEPTH_TEST);
	glClearColor(0,0,0,0);

	// load textures
	glEnable(GL_TEXTURE_2D);
	int		ww, hh;
	unsigned char  *texData;
	for(int i=0; i<_recordCount; i++) {
	    readPPM(_records[i].imageFilename, ww, hh, texData);
	    glGenTextures  (1, &_records[i].texId);
	    glBindTexture  (GL_TEXTURE_2D,  _records[i].texId);
	    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
	    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
	    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR); 
	    glTexImage2D   (GL_TEXTURE_2D, 0, 3, ww, hh, 0, GL_RGB,
			    GL_UNSIGNED_BYTE, texData);
	}
	glDisable(GL_TEXTURE_2D);
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// display:
//
// Display handler routine.
//
void display()
{
	// clear color and depth buffers
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glLoadIdentity();

	// draw all records
	drawRecords();

	// update the screen
	glutSwapBuffers();
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// reshape:
//
// Reshape handler routine. Called after reshaping window.
//
void resize(int width, int height)
{
	glViewport(0, 0, width, height);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(90., (float) width/height, 1.0, 1000);
	glMatrixMode(GL_MODELVIEW);
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// keyPress:
//
// KeyPress handler routine. Process the 'q' key to quit.
//
void keyPress(unsigned char key, int x, int y)
{
	switch(key) {
	case 'q':
		quit();
		break;
	}
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// specialkeyPress:
//
// Special keypass handler routine. Process left/right arrows to scroll.
//
void specialKeyPress(int key, int x, int y)
{
	switch(key) {
	case GLUT_KEY_LEFT:
		scrollRecords(-1);
		break;
	case GLUT_KEY_RIGHT:
		scrollRecords(1);
		break;
	}
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// scrollRecords:
//
// Init scrolling parameters to scroll left (dir=-1) or right (dir=1).
//
void scrollRecords(int dir)
{
	// do nothing if we are already scrolling
	if(_bScrolling) return;

	// init scrolling params
	_bScrolling = 1;		// flag scrolling condition
	_scrollDir = dir;		// save scrolling direction

	// register a timer callback (scrollTimer) to be triggered in a
	// specified number of milliseconds
	glutTimerFunc(_scrollUpdateInterval, scrollTimer, 0);
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// scrollTimer:
//
// Timer callback function. Update scrolling parameters.
//
void scrollTimer(int value)
{
	static unsigned int counter=0;

	// update velocity and position
	 counter++;
	_scrollOffset = (float)_scrollDir * counter * _scrollUpdateInterval
			      / _scrollTime;

	// last iteration
	if(fabs(_scrollOffset) >= 1 ||
	   counter >= _scrollTime/(_scrollUpdateInterval)) {
		 counter	= 0;
		_scrollDir	= 0;
		_scrollOffset	= 0;
		_bScrolling	= 0;
		 display();
	} else {
		display();
		glutTimerFunc(_scrollUpdateInterval, scrollTimer, 0);
	}
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// drawRecords:
//
// Draw all records.
//
void drawRecords()
{
	int	 i, middle, incoming, outgoing;
	float	 front, center_dist, w2;
	vector3f pos;

	// center of the bounding box
	pos[0] = 0;
	pos[1] = -_records[0].height/2.0;
	pos[2] = -6;

	// center scene
	glTranslatef(pos[0], pos[1], pos[2]);
	front	    = 2.0;
	center_dist = 5.0;
	middle	    = _recordCount  / 2;
	if(_scrollOffset > 0) {		// scroll right
		incoming = middle-1;
		outgoing = middle;
	} else {			// scroll left
		incoming = middle+1;
		outgoing = middle;
	}

	// leftmost record position
	pos[0] = -middle - center_dist + _scrollOffset - 1;
	pos[1] =  0;
	pos[2] =  0;
	glPushMatrix();
	glTranslatef(pos[0], pos[1], pos[2]);

	// draw all shifting (non-rotating) records
	for(i= 0; i<_recordCount; i++) {
		// move over records that do not purely translate
		if(i == incoming || i == outgoing) {
			glTranslatef(1 + center_dist, 0, 0);
			continue;
		}

		glTranslatef(1, 0, 0);
		drawRecord(&_records[i]);
	}
	glPopMatrix();

	// draw central incoming rotating record
	w2 = _records[middle].width / 2.0;
	if(_scrollOffset <= 0) {
		pos[0] = (1+_scrollOffset) *  -w2 +
			 (  _scrollOffset) * (center_dist+1);
		pos[1] =  0;
		pos[2] = (1+_scrollOffset) * front;
	} else {
		pos[0] = (1-_scrollOffset) *   w2 +
			 (  _scrollOffset) * (center_dist+1);
		pos[1] =  0;
		pos[2] = (1-_scrollOffset) * front;
	}
	glPushMatrix();
	glTranslatef(pos[0], pos[1], pos[2]);

	// rotate it between 90 and 180 degrees if scrollOffset < 0
	// rotate it between 90 and  0  degrees if scrollOffset > 0
	glRotatef(90.0 * (1-_scrollOffset), 0, 1, 0);

	// translate so that it rotates around the other edge
	if(_scrollOffset <= 0)
		glTranslatef(0, 0, _records[middle].width);

	drawRecord(&_records[middle]);
	glPopMatrix();

	// draw central outgoing rotating record
	if(_scrollOffset <= 0) {
		pos[0] = -w2*_scrollOffset + (center_dist+1)*(1+_scrollOffset);
		pos[1] =  0;
		pos[2] = _scrollOffset * -front;

		glPushMatrix();
		glTranslatef(pos[0], pos[1], pos[2]);
		glRotatef(-90.0*_scrollOffset, 0, 1, 0);
		drawRecord(&_records[incoming]);
	} else {
		pos[0] = -w2*_scrollOffset - (center_dist+1)*(1-_scrollOffset);
		pos[1] =  0;
		pos[2] = _scrollOffset * front;

		glPushMatrix();
		glTranslatef(pos[0], pos[1], pos[2]);
		glRotatef(-90.0*_scrollOffset, 0, 1, 0);
		drawRecord(&_records[outgoing]);
	}
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// drawRecord:
//
// Draw one record.
//
void drawRecord(Record *record)
{
	// enable texture mapping and bind image to polygon
	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, record->texId);

	// draw filled polygon
	glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
	glColor3f(.8, .8, .7);
	glBegin(GL_QUADS);
		glTexCoord2f(1, 1);	glVertex3f(0, 0, 0);
		glTexCoord2f(0, 1);	glVertex3f(0, 0, -record->width);
		glTexCoord2f(0, 0);	glVertex3f(0, record->width, -record->width);
		glTexCoord2f(1, 0);	glVertex3f(0, record->width, 0);
	glEnd();
	glDisable(GL_TEXTURE_2D);

	// draw polygon outline
	glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
	glEnable(GL_LINE_SMOOTH);
	glColor3f(.8, 0, 0);
	glBegin(GL_QUADS);
		glVertex3f(0, 0, 0);
		glVertex3f(0, 0, -record->width);
		glVertex3f(0, record->width, -record->width);
		glVertex3f(0, record->width, 0);
	glEnd();
	glDisable(GL_LINE_SMOOTH);
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// quit:
//
// Free allocated data and quit
//
void quit()
{
	 free(_records);
	 exit(0);
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// readPPM:
//
// Read a PPM file.
// Pass back dimensions and image pointer in width, height, and image.
// Return 1 for success, or 0 for failure.
//
int
readPPM(char *file, int &width, int &height, unsigned char* &image)
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
