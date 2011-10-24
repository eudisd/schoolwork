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

		glEnable(GL_TEXTURE_2D);
		glBindTexture(GL_TEXTURE_2D, TexId1);

		// Draw the base image (monkey)
		glBegin(GL_POLYGON);
			glTexCoord2f(0, 1); glVertex2i(  Margin, H-Margin);
			glTexCoord2f(0, 0); glVertex2i(  Margin,   Margin);
			glTexCoord2f(1, 0); glVertex2i(W-Margin,   Margin);
			glTexCoord2f(1, 1); glVertex2i(W-Margin, H-Margin);
		glEnd();

		glDisable(GL_TEXTURE_2D);

		glEnable(GL_TEXTURE_2D);
		glBindTexture(GL_TEXTURE_2D, TexId2);

		float i0, i1, 
			  a0, a1, 
			  b0, b1, 
			  A0, A1,
			  B0, B1;

		float j, g, p;


		// Distance from click point to bottom intersection
		i0 = sqrt((bottom[0] - x)*(bottom[0] - x) + 
				 (bottom[1] - y)*(bottom[1] - y));

		b0 = x - bottom[0];
		a0 = H - Margin - y;
		B0 = h * (b0/i0);
		A0 = B0*a0/b0;

		// Distance from click point to right intersection
		i1 = sqrt((right[0] - x)*(right[0] - x) + 
			      (right[1] - y)*(right[1] - y));

		b1 = (right[1] - y);
		a1 = W - Margin - x;

		B1 = (b1/i1)*w;
		A1 = (a1*B1)/b1;
		

		// Last point of the quad
		p = B1 + A1;
		j = sqrt((float)h*h + (float)w*w);
		g = sqrt(j*j - p*p);

		glEnable(GL_TEXTURE_2D);
		glBindTexture(GL_TEXTURE_2D, TexId2);
		glBegin(GL_POLYGON);
			
			glTexCoord2f(0, 1); glVertex2f(x, y); // Top left V, Bottom Left of Pic 
			glTexCoord2f(1, 1); glVertex2f(x - B0, y + A0);  // Bottom Left V, Bottom Right of Pic
			glTexCoord2f(1, 0); glVertex2f(x + g, y + p); // Bottom Right of V, Top Right of Pic
			glTexCoord2f(0, 0); glVertex2f(x + A1, y + B1); // Top Right, Top Left of Pic
			
		glEnd();
		glDisable(GL_TEXTURE_2D);

		// draw lifted triangle
		glPolygonMode(GL_FRONT, GL_FILL);
		glColor3f(0.0, 0.0, 0.0);

		// Clear out the lifted polygon initial space

		glBegin(GL_POLYGON);
			
			// xsect at right edge
			glVertex2f(right[0], right[1]);
			// xsect at bottom edge
			glVertex2f(bottom[0], bottom[1]);

			glVertex2f(x - B0, y + A0);  // Left
			glVertex2f(x + g, y + p); // bottom
			glVertex2f(x + A1, y + B1); // Right
			
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

		float p2, j2, g2, b2, c2, B2, C2, A2;

		b2 = fabs(sqrt((Hx - Dx)*(Hx - Dx) + (Hy - Dy)*(Hy - Dy)));
		B2 = w;
		c2 = fabs(Hy - Dy);
		C2 = fabs(B2*c2/b2);

		A2 = sqrt(B2*B2 - C2*C2);
		p2 = fabs(C2 + A2);
		j2 = sqrt((float)w*w + (float)h*h);

		g2 = sqrt(j2*j2 - p2*p2);
		
		glEnable(GL_TEXTURE_2D);
		glBindTexture(GL_TEXTURE_2D, TexId2);

		glBegin(GL_POLYGON);

			// draw lifted corner point and next lifted corner (Bottom Left)
			glTexCoord2f(0, 1); glVertex2f(x, y);  // Bottom Left V, 
			glTexCoord2f(0, 0); glVertex2f(Dx, Dy);  // Top Left
			glTexCoord2f(1, 0); glVertex2f(Dx + A2, Dy + C2); // Top Right
			glTexCoord2f(1, 1); glVertex2f(Dx + g2, Dy + p2); // Bottom right
 
		glEnd(); 


		// Clear out the lifted polygon initial space

		glPolygonMode(GL_FRONT, GL_FILL);
		glColor3f(0.0, 0.0, 0.0);
		glBegin(GL_POLYGON);
			
			// xsect at top left edge
			glVertex2f(top[0], top[1]);
			// xsect at bottom left edge
			glVertex2f(bottom[0], bottom[1]);

			glVertex2f(Dx + g2, Dy + p2); // Bottom right
			glVertex2f(Dx + A2, Dy + C2); // Top Right
			
		glEnd();
		/*
		glBegin(GL_POLYGON);
			
			// xsect at top left edge
			glVertex2f(Hx, Hy);
			// xsect at bottom left edge
			glVertex2f(Dx + A2, Hy);
			glVertex2f(Dx + A2, Dy + C2);
		
		glEnd();*/

		glColor3f(1.0, 1.0, 1.0);
		
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

	// Clear out the initial lifted polygon area with black

	glPolygonMode(GL_FRONT, GL_FILL);
	glColor3f(0.0, 0.0, 0.0);
	glBegin(GL_POLYGON);
		// draw page outline
	glBegin(GL_POLYGON);
	
		// draw bottom left / upper left corners, and top / bottom xsects
		
		glVertex2f(Hx, Hy);
		glVertex2f(Ex, Ey);

		glVertex2i(  W-Margin, H-Margin);
		glVertex2i(  W-Margin,   Margin);

	glEnd();
	glColor3f(1.0, 1.0, 1.0);

	// flush to display
	glutSwapBuffers();
}