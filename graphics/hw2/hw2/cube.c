
#include <stdlib.h>
#include <GL/glut.h>

	GLfloat vertices[] = {  -1.0,-1.0,-1.0,
							 1.0,-1.0,-1.0,
							 1.0,1.0,-1.0, 
							-1.0,1.0,-1.0, 
							-1.0,-1.0,1.0, 
							 1.0,-1.0,1.0, 
							 1.0,1.0,1.0, 
							-1.0,1.0,1.0};

	GLfloat colors[] = {0.0, 0.0, 0.0, 1.0, 0.0, 0.0,
						1.0,1.0,0.0, 0.0,1.0,0.0, 0.0,0.0,1.0, 
						1.0,0.0,1.0, 1.0,1.0,1.0, 0.0,1.0,1.0};

	GLfloat bcolors[] = {0.0,0.0,0.0,0.0,0.0,0.0,
						 0.0,0.0,0.0, 0.0,0.0,0.0, 0.0,0.0,0.0, 
						 0.0,0.0,0.0, 0.0,0.0,0.0, 0.0,0.0,0.0};

    GLubyte cubeIndices[]={0,3,2,1,
		                   2,3,7,6,0,
						   4,7,3,1,2,
						   6,5,4,5,6,
						   7,0,1,5,4};



static GLfloat theta[] = {0.0, 0.0, 0.0};
static GLint axis = 2;

void display(void)
{

	GLfloat light[3] = {0.0, 20.0, 0.0};
	GLfloat light1[3] = {20.0, 0.0, 0.0};
	GLfloat light2[3] = {0.0, 0.0, 20.0};
	GLfloat m[16];

    int i;
	for(i = 0; i < 16; i++) {
		m[i] = 0.0;
	}

    m[0] = m[5] = m[10] = 1.0;
	//m[3] = -1.0/light[0];
	m[7] = -1.0/light[1];
	//m[11] = -1.0/light[2];
	/*
	0 4 8  12
	1 5 9  13
	2 6 10 14
	3 7 11 15
	*/

	/* display callback, clear frame buffer and z buffer,
       rotate cube and draw, swap buffers */

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	glLoadIdentity();
	gluLookAt(1.0,1.0,1.0, // eye
			  0.0,0.0,0.0, // reference point
			  0.0,1.0,0.0  // up vector
			  );
	
	glPushMatrix();
		glTranslatef(0.0, 3.0, 0.0);
		glRotatef(theta[0], 1.0, 0.0, 0.0);
		glRotatef(theta[1], 0.0, 1.0, 0.0);
		glRotatef(theta[2], 0.0, 0.0, 1.0);
		glColorPointer(3, GL_FLOAT, 0, colors); 
		glDrawElements(GL_QUADS, 24, GL_UNSIGNED_BYTE, cubeIndices);
	glPopMatrix();
	
	glPushMatrix();
		glColor3f(0.8, 0.5, 0.0);
		glPolygonMode(GL_FRONT, GL_FILL);
		glBegin(GL_QUADS);
			glVertex3f(-2.0, 0.0, 4.0);
			glVertex3f(-2.0, 0.0, -2.0);
			
			glVertex3f(4.0, 0.0, -2.0);
			glVertex3f(4.0, 0.0, 4.0);
		glEnd();

		glColor3f(0.0, 0.8, 0.5);
		glBegin(GL_QUADS);
			glVertex3f(-2.0, 6.0, -2.0);
			glVertex3f(-2.0, 0.0, -2.0);
			glVertex3f(4.0, 0.0, -2.0);
			glVertex3f(4.0, 6.0, -2.0);
		glEnd();

		glColor3f(0.5, 0.0, 0.8);
		glBegin(GL_QUADS);
			glVertex3f(-2.0, 0.0, 4.0);
			glVertex3f(-2.0, 0.0, -2.0);
			glVertex3f(-2.0, 6.0, -2.0);
			glVertex3f(-2.0, 6.0, 4.0);
		glEnd();
	glPopMatrix();
	
	
	glPushMatrix();
		glTranslatef(light[0], light[1],light[2]);
		glMultMatrixf(m);
		glTranslatef(-light[0], -light[1],-light[2]);
		glColor3f(0.0,0.0,0.0);
		glRotatef(theta[0], 1.0, 0.0, 0.0);
		glRotatef(theta[1], 0.0, 1.0, 0.0);
		glRotatef(theta[2], 0.0, 0.0, 1.0);

		glColorPointer(3,GL_FLOAT, 0, bcolors); 
 		glDrawElements(GL_QUADS, 24, GL_UNSIGNED_BYTE, cubeIndices);
	glPopMatrix();

	m[7] = 0.0;
	m[3] = -1/light1[0];
	glPushMatrix();
		glTranslatef(light1[0], light1[1],light1[2]);
		glMultMatrixf(m);
		glTranslatef(-light1[0], -light1[1],-light1[2]);
		glColor3f(0.0,0.0,0.0);
		glRotatef(theta[0], 1.0, 0.0, 0.0);
		glRotatef(theta[1], 0.0, 1.0, 0.0);
		glRotatef(theta[2], 0.0, 0.0, 1.0);

		glColorPointer(3,GL_FLOAT, 0, bcolors); 
 		glDrawElements(GL_QUADS, 24, GL_UNSIGNED_BYTE, cubeIndices);
	glPopMatrix();
	
	m[7] = 0.0;
	m[3] = 0.0;
	m[11] = -1/light2[2];
	glPushMatrix();
		glTranslatef(light2[0], light2[1],light2[2]);
		glMultMatrixf(m);
		glTranslatef(-light2[0], -light2[1],-light2[2]);
		glColor3f(0.0,0.0,0.0);
		glRotatef(theta[0], 1.0, 0.0, 0.0);
		glRotatef(theta[1], 0.0, 1.0, 0.0);
		glRotatef(theta[2], 0.0, 0.0, 1.0);

		glColorPointer(3,GL_FLOAT, 0, bcolors); 
 		glDrawElements(GL_QUADS, 24, GL_UNSIGNED_BYTE, cubeIndices);
	glPopMatrix();
	
	glutSwapBuffers(); 
}

void spinCube()
{

/* Idle callback, spin cube 2 degrees about selected axis */

	theta[axis] += 0.5;
	if( theta[axis] > 360.0 ) theta[axis] -= 360.0;
	glutPostRedisplay();
}

void mouse(int btn, int state, int x, int y)
{

/* mouse callback, selects an axis about which to rotate */

	if(btn==GLUT_LEFT_BUTTON && state == GLUT_DOWN) axis = 0;
	if(btn==GLUT_MIDDLE_BUTTON && state == GLUT_DOWN) axis = 1;
	if(btn==GLUT_RIGHT_BUTTON && state == GLUT_DOWN) axis = 2;
}

void myReshape(int w, int h)
{
    glViewport(0, 0, w, h);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    if (w <= h)
        glOrtho(-4.0, 4.0, -3.0 * (GLfloat) h / (GLfloat) w,
            5.0 * (GLfloat) h / (GLfloat) w, -10.0, 10.0);
    else
        glOrtho(-4.0 * (GLfloat) w / (GLfloat) h,
            4.0 * (GLfloat) w / (GLfloat) h, -3.0, 5.0, -10.0, 10.0);
    glMatrixMode(GL_MODELVIEW);
}

void
main(int argc, char **argv)
{


/* need both double buffering and z buffer */

    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize(500, 500);
    glutCreateWindow("colorcube");
    glutReshapeFunc(myReshape);
    glutDisplayFunc(display);
    glutIdleFunc(spinCube);
    glutMouseFunc(mouse);
    glEnable(GL_DEPTH_TEST); /* Enable hidden--surface--removal */
 	glEnableClientState(GL_COLOR_ARRAY); 
	glEnableClientState(GL_VERTEX_ARRAY);
	glVertexPointer(3, GL_FLOAT, 0, vertices);
    glColorPointer(3,GL_FLOAT, 0, colors); 
	glClearColor(1.0,1.0,1.0,1.0);
	glColor3f(1.0,1.0,1.0);
    glutMainLoop();
}
