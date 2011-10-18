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

#include "fcts.h" // Include helper functions

using namespace std;

// function prototypes
//static void display	(void);
static void reshape	(int, int);
static void mouse	(int, int, int, int);
static void motion	(int, int);
//static void init	(void);
static void drawLowerRightCorner1(int, int);
static void drawLowerRightCorner2(int, int);

// global variables
extern int	W, H, Margin;
extern GLuint TexId1, TexId2;


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

	//	     ____
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

		float txt_right[2] = {right[0]/w, right[1]/h}, 
			txt_bottom[2] = {bottom[0]/w, bottom[1]/h};

		printf("txt_right[0][1]/W/H: %f, %f\n", txt_right[0]/w, txt_right[1]/w); 
		glEnable(GL_TEXTURE_2D);
		glBindTexture(GL_TEXTURE_2D, TexId1);

		glBegin(GL_POLYGON);
			glTexCoord2f(0, 1); glVertex2i(  Margin, H-Margin);
			glTexCoord2f(0, 0); glVertex2i(  Margin,   Margin);
			glTexCoord2f(1, 0); glVertex2i(W-Margin,   Margin);
			glTexCoord2f(1, 1); glVertex2i(W-Margin, H-Margin);
		glEnd();
		
		glDisable(GL_TEXTURE_2D);

		// draw lifted triangle
		glBegin(GL_POLYGON);
			glVertex2f(x, y);		// lifted corner point
			// xsect at right edge
			glVertex2f(right[0], right[1]);
			// xsect at bottom edge
			glVertex2f(bottom[0], bottom[1]);
		glEnd();

		// draw lifted triangle
		glPolygonMode(GL_FRONT, GL_FILL);
		glColor3f(0.0, 0.0, 0.0);
		// Clear out the lifted polygon initial space
		glBegin(GL_POLYGON);
			glVertex2f(W-Margin, H-Margin);		// lifted corner point
			// xsect at right edge
			glVertex2f(right[0], right[1]);
			// xsect at bottom edge
			glVertex2f(bottom[0], bottom[1]);
		glEnd();

		glColor3f(1.0, 1.0, 1.0);

		


	} else {
		
		glEnable(GL_TEXTURE_2D);
		glBindTexture(GL_TEXTURE_2D, TexId1);
		// draw main polygon
		glBegin(GL_POLYGON);
			glTexCoord2f(0, 1); glVertex2i(  Margin, H-Margin);
			glTexCoord2f(0, 0); glVertex2i(  Margin,   Margin);
			glTexCoord2f(1, 0); glVertex2i(W-Margin,   Margin);
			glTexCoord2f(1, 1); glVertex2i(W-Margin, H-Margin);
		glEnd();

		glDisable(GL_TEXTURE_2D);

		// Clear out the lifted polygon initial space

		glPolygonMode(GL_FRONT, GL_FILL);
		glColor3f(0.0, 0.0, 0.0);
		glBegin(GL_POLYGON);
			
			// xsect at top edge
			glVertex2f(top[0], top[1]);
			// xsect at bottom edge
			glVertex2f(bottom[0], bottom[1]);

			glVertex2i(  W-Margin, H-Margin);
			glVertex2i(  W-Margin,   Margin);
		glEnd();

		glColor3f(1.0, 1.0, 1.0);


		// draw lifted quadrilateral

			  // D
		float d = sqrt(dx*dx + a*a),
			  AE = dx/d*h,
			  DE = a/d*h,

			  // H
			  DG = (y + DE) - top[1],
			  GH = a/dx * DG,

			  // Coords
		      Dx = x + AE, 
			  Dy = y + DE,
		      Hx = Dx + GH, 
			  Hy = top[1];

		glBegin(GL_POLYGON);

			// draw lifted corner point and next lifted corner
			glVertex2f(x, y);  
			glVertex2f(Dx, Dy);    // D

			// xsect at right edge
			glVertex2f(Hx, Hy);    // H
			
			// xsect at bottom edge
			glVertex2f(bottom[0], bottom[1]); 
		glEnd(); 
		
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
	float	bottom[2], top[2], corner[2];

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

	//	     a
	//	    ____
	//	    |  /
	//   dy | / b	  Lifted folded triangle below bottom right corner
	//	    |/
	//
	// Note: a + b = dx (distance from left of triangle to right paper edge)
	// Plug  a = dx - b into:
	//	 dy^2 + a^2 = b^2
	// Solve for b to get:
	//	 b = (dx^2 + dy^2) / 2dx
	// 
	double b = (dx*dx + dy*dy) / (2*dx);
	double a =  dx - b;
	
	double DF = dy/b*h,
		   AF = a/b*h;

	// eval intersection on bottom edge
	bottom[0] = x + a;       // Ex
	bottom[1] = h + Margin;  // Ey

	// eval position of lifted top right corner
	corner[0] = x + DF;  // Dx
	corner[1] = y - AF;  // Dy
	
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

	double Dx = corner[0],
		   Dy = corner[1],
		   Ex = bottom[0],
		   Ey = bottom[1],
		   Hx = (Dx) + a,  // Dx = x + DF
		   Hy = top[1];


	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, TexId1);
	glBegin(GL_POLYGON);
		glTexCoord2f(0, 1); glVertex2i(  Margin, H-Margin);
		glTexCoord2f(0, 0); glVertex2i(  Margin,   Margin);
		glTexCoord2f(1, 0); glVertex2i(W-Margin,   Margin);
		glTexCoord2f(1, 1); glVertex2i(W-Margin, H-Margin);
	glEnd();

	glDisable(GL_TEXTURE_2D);
	// draw page outline
	glBegin(GL_POLYGON);
	
		// draw bottom left / upper left corners, and top / bottom xsects
		glVertex2i(  Margin, H-Margin);
		glVertex2i(  Margin,   Margin);
		glVertex2f(Hx, Hy);
		glVertex2f(Ex, Ey);

	glEnd();

	// draw lifted quadrilateral
	
	glBegin(GL_POLYGON);

		// draw lifted corner point and next lifted corner
		glVertex2f(x, y);
		glVertex2f(Dx, Dy);

		// xsect at right edge
		glVertex2f(Hx, Hy);

		// xsect at bottom edge
		glVertex2f(Ex, Ey);
	glEnd();

	// flush to display
	glutSwapBuffers();
}