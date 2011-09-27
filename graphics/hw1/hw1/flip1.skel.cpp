// ======================================================================
//
// flip1.skel.cpp - Page flip simulation.
//
// Written by: George Wolberg, 2007
// ======================================================================
//

#include <iostream>
#include <fstream>
#include <cmath>
#include <cassert>
#include <GL/glut.h>
using namespace std;

// function prototypes
static void display	(void);
static void reshape	(int, int);
static void mouse	(int, int, int, int);
static void motion	(int, int);
static void init	(void);
static void drawLowerRightCorner1(int, int);
static void drawLowerRightCorner2(int, int);

// global variables
int		W, H, Margin;

// macros
#define CLIP(A,L,H)	((A)<=(L) ? (L) : (A)<=(H) ? (A) : (H))


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// main:
//
// Page flip simulation.
//
int
main(int argc, char **argv)
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);
	glutInitWindowSize(256, 256);
	glutCreateWindow(argv[0]);
	init();
	glutDisplayFunc	(display);
	glutReshapeFunc	(reshape);
	glutMouseFunc	(mouse);
	glutMotionFunc	(motion);
	glutMainLoop();
	return 0;
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// init:
//
// Initialization routine before display loop.
//
static void
init(void)
{
	glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
	glColor3f    (1.0, 1.0, 1.0);
	glClearColor (0.0, 0.0, 0.0, 1.0);

	// init global vars
	W = 0;
	H = 0;
	Margin = 40;
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// display:
//
// Display handler routine.
//
static void
display(void)
{
	// clear color and depth buffer to background values
	glClear(GL_COLOR_BUFFER_BIT);

	// draw page outline
	glColor3f(1.0, 1.0, 1.0);
	glBegin(GL_POLYGON);
		glVertex2i(  Margin,   Margin);
		glVertex2i(  Margin, H-Margin);
		glVertex2i(W-Margin, H-Margin);
		glVertex2i(W-Margin,   Margin);
	glEnd();

	// flush display
	glutSwapBuffers();	
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// reshape:
//
// Reshape handler routine. Called after reshaping window.
//
static void
reshape(int w, int h)
{
	W  = w;
	H  = h;

	glViewport(0, 0, w, h);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluOrtho2D(0., (double) w, (double) h, 0.);
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// mouse:
//
// Mouse handler routine.
//
static void
mouse(int button, int state, int x, int y)
{
	switch(button) {
	case GLUT_LEFT_BUTTON:
		glutPostRedisplay();
		break;
	default:
		break;
	}
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// motion:
//
// Mouse motion handler routine.
//
static void
motion(int x, int y)
{
	if((H-Margin)-y > 0)	// pull corner above lower edge of page
		drawLowerRightCorner1(x, y);
	else	drawLowerRightCorner2(x, y);
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// lowerRightCorner1:
//
// Draw folded triangle or quadrilateral when lower right corner is
// pulled ABOVE lower edge of page.
//
static void
drawLowerRightCorner1(int x, int y)
{
	float	bottom[2], right[2], top[2], corner[2];

	// clear color and depth buffer to background values
	glClear(GL_COLOR_BUFFER_BIT);

	// init page dimensions
	int w = W - 2*Margin;
	int h = H - 2*Margin;

	// flag default case: folded triangle at corner
	int triangle = 1;

	// clip x
	if(x > W-Margin) x = W-Margin;

	// distance between (x,y) and page boundary
	int dx = (W-Margin) - x;
	int dy = (H-Margin) - y;

	double len = sqrt((double)(x-Margin)*(x-Margin) + dy*dy);
	if(dy < 0 || len >= w) return;

	//	 ____
	//       \dx|
	//      b \ | a   Lifted folded triangle above bottom right corner
	//         \|
	//
	// Note: a + b = dy (distance from top of triangle to bottom paper edge)
	// Plug  a = dy - b into:
	//	 dx^2 + a^2 = b^2
	// Solve for b to get:
	//	 b = (dx^2 + dy^2) / 2dy
	// 
	double b = (dx*dx + dy*dy) / (2*dy);
	double a =  dy - b;

	// eval intersection on right and bottom edges
	bottom[0] = x - a*dy/dx;
	bottom[1] = H-Margin;
	right [0] = W-Margin;
	right [1] = y + a;

	// error checking: avoid tearing bottom edge of paper from spine
	if(bottom[0] < Margin) {
		bottom[0] = Margin;		// clamp bottom x to spine
		x  = (int) sqrt((double)w*w - dy*dy);	// adjust lifted corner position
		x += Margin;			// add back the Margin pixels
	}

	// error checking: lifted quadrilateral, not triangle
	if(right[1] < Margin) {
		// flag quadrilateral case
		triangle = 0;

		// eval position of lifted top right corner
		double  d = sqrt(dx*dx + a*a);
		corner[0] = x + (h * dx/d);
		corner[1] = y + (h *  a/d);

		top[0] = corner[0] + ((corner[1]-Margin) * a/dx);
		top[1] = Margin;
	}

	// draw page outline
	if(triangle) {
		/*
		// draw main polygon
		glBegin(GL_POLYGON);

		// draw bottom left, upper left, and upper right corners
		glVertex2f(..., ...);
		glVertex2f(..., ...);
		glVertex2f(..., ...);

		// xsect at right edge
		glVertex2f(..., ...);

		// xsect at bottom edge
		glVertex2f(..., ...);
		glEnd();

		// draw lifted triangle
		glBegin(GL_POLYGON);
		glVertex2f(..., ...);		// lifted corner point

		// xsect at right edge
		glVertex2f(..., ...);

		// xsect at bottom edge
		glVertex2f(..., ...);
		glEnd();
	} else {
		// draw main polygon
		glBegin(GL_POLYGON);

		// draw bottom left and upper left corners
		glVertex2f(..., ...);
		glVertex2f(..., ...);

		// xsect at top edge
		glVertex2f(..., ...);

		// xsect at bottom edge
		glVertex2f(..., ...);
		glEnd();

		// draw lifted quadrilateral
		glBegin(GL_POLYGON);

		// draw lifted corner point and next lifted corner
		glVertex2f(..., ...);
		glVertex2f(..., ...);

		// xsect at right edge
		glVertex2f(..., ...);

		// xsect at bottom edge
		glVertex2f(..., ...);
		glEnd();
		*/
	}

	// flush to display
	glutSwapBuffers();
}



// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// lowerRightCorner2:
//
// Draw folded quadrilateral when lower right corner is
// pulled BELOW lower edge of page.
//
static void
drawLowerRightCorner2(int x, int y)
{
	float	bottom[2], right[2], top[2], corner[2];

	// clear color and depth buffer to background values
	glClear(GL_COLOR_BUFFER_BIT);

	// init page dimensions
	int w = W - 2*Margin;
	int h = H - 2*Margin;

	// clip x
	if(x > W-Margin) x = W-Margin;

	// distance between (x,y) and page boundary
	float dx = (W-Margin) - x;
	float dy = (H-Margin) - y;

	double len = sqrt((x-Margin)*(x-Margin) + dy*dy);
	if(dy > 0 || len >= w) return;

	//	  a
	//	____
	//	|  /
	//   dy | / b	  Lifted folded triangle below bottom right corner
	//	|/
	//
	// Note: a + b = dx (distance from left of triangle to right paper edge)
	// Plug  a = dx - b into:
	//	 dy^2 + a^2 = b^2
	// Solve for b to get:
	//	 b = (dx^2 + dy^2) / 2dx
	// 
	double b = (dx*dx + dy*dy) / (2*dx);
	double a =  dx - b;

	// eval intersection on bottom edge
	/*
	bottom[0] = ...
	bottom[1] = ...

	// eval position of lifted top right corner
	corner[0] = ...
	corner[1] = ...
	*/

	dx = (W-Margin) - corner[0];
	dy =  corner[1] - Margin;
	b  = (dx*dx + dy*dy) / (2*dx);
	a  =  dx - b;

	// eval position of lifted top left corner
	top[0] = corner[0] + a;
	top[1] = Margin;

	// error checking: avoid tearing top edge of paper from spine
	if(top[0] < Margin) {
		corner[0] += (Margin-top[0]);	// reset lifted corner
		top[0] = Margin;		// clamp top x to spine
	}

	// draw page outline
	glBegin(GL_POLYGON);
	/*
	// draw bottom left / upper left corners, and top / bottom xsects
	glVertex2f(...,  ...);
	glVertex2f(...,  ...);
	glVertex2f(...,  ...);
	glVertex2f(...,  ...);
	glEnd();

	// draw lifted quadrilateral
	glBegin(GL_POLYGON);

	// draw lifted corner point and next lifted corner
	glVertex2f(..., ...);
	glVertex2f(..., ...);

	// xsect at right edge
	glVertex2f(..., ...);

	// xsect at bottom edge
	glVertex2f(..., ...);
	*/
	glEnd();

	// flush to display
	glutSwapBuffers();
}