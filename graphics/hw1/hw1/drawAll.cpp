#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <GL/glut.h>

void init();
void display();

float points[][2] = {{0.0, 0.0}, {0.25, 0.0}, {0.50, 0.0}, {0.75, 0.2},
{0.75, 0.4}, {0.5, 0.6}, {0.25, 0.6},{0.25, 0.8}, 
{0.0, 0.8}, {0.0, 0.6}, {0.0, 0.4}, {0.0, 0.2}, 
{0.25, 0.2}, {0.5, 0.2}, {0.5, 0.4}, {0.25, 0.4}};

int main(int argc, char **argv){

	glutInitDisplayMode( GLUT_DOUBLE | GLUT_RGB );
	glutInitWindowSize(600, 600);
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
	glOrtho(0.0, 1.0, 0.0, -1.0, -1.0, 1.0);
}

void display() {
	glClear(GL_COLOR_BUFFER_BIT);
	
	glViewport(0, 0, 200, 200);  // 1

	glBegin(GL_POINTS);
		//for(int i = 0; i < 16; i++)
		//	glVertex2fv(points[i]);
		glVertex2f(0.5, 0.0);
	glEnd();
	
	
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	/*
	glViewport(200, 0, 200, 200); // 2
	glBegin(GL_LINES);
	glEnd();

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(400, 0, 200, 200); // 3
	glBegin(GL_LINE_STRIP); 
	glEnd();

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(0, 200, 200, 200); // 4
	glBegin(GL_LINE_LOOP);
	glEnd();

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(200, 200, 200, 200); // 5
	glBegin(GL_TRIANGLES);
	glEnd();

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(400, 200, 200, 200); // 6

	glBegin(GL_TRIANGLE_STRIP);
	glEnd();

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(0, 400, 200, 200); // 7
	glBegin(GL_TRIANGLE_FAN);
	glEnd();

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(200, 400, 200, 200); // 8
	glBegin(GL_QUADS);
	glEnd();

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
	
	glViewport(400, 400, 200, 200); // 9
	glBegin(GL_POLYGON);
	glEnd();
	*/
	glFlush();
	glutSwapBuffers();
}