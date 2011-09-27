#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <GL/glut.h>

int h = 600, w = 600;

void init();
void display();

float points[][2] = {{0.2, 0.7}, {0.5, 0.7}, {0.7, 0.7}, {0.9, 0.6}, 
{0.9, 0.5}, {0.7, 0.4},{0.5, 0.4}, {0.5, 0.0}, 
{0.2, 0.0}, {0.2, 0.4}, {0.2, 0.5}, {0.2, 0.6},
{0.5, 0.6}, {0.7, 0.6}, {0.7, 0.5}, {0.5, 0.5}};

int main(int argc, char **argv){

	glutInitDisplayMode( GLUT_DOUBLE | GLUT_RGB );
	glutInitWindowSize(w, h);
	glutInitWindowPosition(0, 0);
	glutCreateWindow(argv[0]);

	init();

	glutDisplayFunc(display);
	glutMainLoop();

	return EXIT_SUCCESS;
}

void init() {
	glClearColor(0.0, 0.0, 0.0, 1.0);
	glColor3f(1.0, 1.0, 1.0);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
}

void display() {
	int dw = w / 3, dh = h / 3;
	int i; // Iterator

	glClear(GL_COLOR_BUFFER_BIT);
	
	glViewport(0, 400, 200, 200);  // 1

	glBegin(GL_POINTS);
		for(i = 0; i < 16; i++)
			glVertex2fv(points[i]);
	glEnd();
	
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(200, 400, 200, 200); // 2
	glBegin(GL_LINES);
		for(i = 0; i < 16; i++)
			glVertex2fv(points[i]);
	glEnd();
	
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(400, 400, 200, 200); // 3
	glBegin(GL_LINE_STRIP); 
		for(i = 0; i < 16; i++)
			glVertex2fv(points[i]);
	glEnd();

	
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(0, 200, 200, 200); // 4
	glBegin(GL_LINE_LOOP);
		for(i = 0; i < 16; i++)
			glVertex2fv(points[i]);
	glEnd();

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(200, 200, 200, 200); // 5
	glBegin(GL_TRIANGLES);
		for(i = 0; i < 16; i++)
			glVertex2fv(points[i]);
	glEnd();

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(400, 200, 200, 200); // 6

	glBegin(GL_TRIANGLE_STRIP);
		for(i = 0; i < 16; i++)
			glVertex2fv(points[i]);
	glEnd();

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(0, 0, 200, 200); // 7
	glBegin(GL_TRIANGLE_FAN);
		for(i = 0; i < 16; i++)
			glVertex2fv(points[i]);
	glEnd();

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(200, 0, 200, 200); // 8
	glBegin(GL_QUADS);
		for(i = 0; i < 16; i++)
			glVertex2fv(points[i]);
	glEnd();

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(400, 0, 200, 200); // 9
	glBegin(GL_POLYGON);
		for(i = 0; i < 16; i++)
			glVertex2fv(points[i]);
	glEnd();
	
	glFlush();
	glutSwapBuffers();
}