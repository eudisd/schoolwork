/* 
 * Fill in the missing code in the following program.
 * Run "wave" to see what your completed program should produce as output.
 *
 * By default, the program loads "texmap.rgb" and "envmap.rgb"
 * if no filenames are given as command line arguments.  
 * Specify the texture map as the first argument and the sphere
 * map as the second argument.
 *
 * Left mouse rotates the scene, middle mouse or +/- keys zoom, 
 * right mouse for menu.
 */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <GL/glut.h>
#include "texture.h"

/* user-defined type definition */
typedef int bool;

/* symbolic constants */
#define FALSE		0
#define TRUE		1
#define MAXGRID 	63
#define SQRTOFTWOINV	1.0 / 1.414213562
#define PII		3.14159265358979323846

/* initialize enumerated values */
enum	{WIREFRAME, HIDDENLINE, FLATSHADED, SMOOTHSHADED, TEXTURED};
enum	{FULLSCREEN, FACENORMALS, ANTIALIAS, ENVMAP};
enum	{WEAK, NORMAL, STRONG};
enum	{SMALL, MEDIUM, LARGE, XLARGE};
enum	{CURRENT, FLAT, SPIKE, DIAGONALWALL, SIDEWALL, HOLE, 
	 MIDDLEBLOCK, DIAGONALBLOCK, CORNERBLOCK, HILL, HILLFOUR};

/* initialize global boolean variables to FALSE */
bool	Waving		= FALSE;
bool	Editing		= FALSE;
bool	DrawFaceNorms	= FALSE;
bool	Antialias	= FALSE;
bool	EnvMap		= FALSE;
bool	LeftButton	= FALSE;
bool	MiddleButton	= FALSE;

/* global arrays */
float	Force[MAXGRID][MAXGRID],
	Veloc[MAXGRID][MAXGRID],
	Posit[MAXGRID][MAXGRID],
	vertNorms[MAXGRID][MAXGRID][3],
	FaceNorms[2][MAXGRID][MAXGRID][3],
	FaceNormSegs[2][2][MAXGRID][MAXGRID][3];

/* global variables */
int	DisplayMode = WIREFRAME;
int	ResetMode   = DIAGONALBLOCK;
int	Grid	    = 17;
float	Dt	    = 0.004;

/* global variable declarations for textures */
int	 TexWidth, TexHeight;
int	 TexId1,   TexId2;
GLubyte *TexData;
char	*TexFilename1 = "texmap.rgb";
char	*TexFilename2 = "envmap.rgb";
float	 TexCoords[MAXGRID][MAXGRID][2];

/* global variable declarations for viewing */
float	Phi	= 90.0;
float	Theta	= 45.0;
float	Sdepth	= 5.0/4.0 * MAXGRID;
float	ZNear	= 15.0;
float	ZFar	= 100.0;
float	Aspect	= 5.0/4.0;
long	Xsize, Ysize;

int	DownX, DownY;
int	displayMenu, otherMenu, speedMenu, sizeMenu, resetMenu, mainMenu;
float	lightPosition[] = { 0.0, 0.0, 1.0, 1.0}; 


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * getForce:
 *
 * Init Force applied to each mesh node.
 * Eval force at each point based on neighborhood surface values.
 */
void getForce(void)
{
	int	i, j;
	float	d;

	/* clear Force[][] */
	for(i=0; i<Grid; i++) 
		for(j=0; j<Grid; j++) 
			Force[i][j]=0.0;

	/* update Force[][] based on difference between mesh node heights */
	for(i=2; i<Grid-2; i++) {
		for(j=2; j<Grid-2; j++) {
			d=Posit[i][j]-Posit[i][j-1];
			Force[i][ j ] -= d;
			Force[i][j-1] += d;

			d=Posit[i][j]-Posit[i-1][j];
			Force[ i ][j] -= d;
			Force[i-1][j] += d;

			d= (Posit[i][j]-Posit[i][j+1]); 
			Force[i][ j ] -= d ;
			Force[i][j+1] += d;

			d= (Posit[i][j]-Posit[i+1][j]); 
			Force[ i ][j] -= d ;
			Force[i+1][j] += d;

			d= (Posit[i][j]-Posit[i+1][j+1])*SQRTOFTWOINV; 
			Force[ i ][ j ] -= d ;
			Force[i+1][j+1] += d;

			d= (Posit[i][j]-Posit[i-1][j-1])*SQRTOFTWOINV; 
			Force[ i ][ j ] -= d ;
			Force[i-1][j-1] += d;

			d= (Posit[i][j]-Posit[i+1][j-1])*SQRTOFTWOINV; 
			Force[ i ][ j ] -= d ;
			Force[i+1][j-1] += d;

			d= (Posit[i][j]-Posit[i-1][j+1])*SQRTOFTWOINV; 
			Force[ i ][ j ] -= d ;
			Force[i-1][j+1] += d;
		}
	}
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * getVelocity:
 *
 * Init Velocity=Force*Dt in Veloc[i][j].
 */
void getVelocity(void)
{
	int	i, j;

	for(i=0; i<Grid; i++) {
		for(j=0; j<Grid; j++) {
			Veloc[i][j] += Force[i][j] * Dt;
		}
	}
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * getPosition:
 *
 * Init Position (height) of mesh nodes in Posit[i][j].
 */
void getPosition(void)
{
	int	i, j;

	for(i=0; i<Grid; i++) {
		for(j=0;j<Grid;j++) {
			Posit[i][j]+=Veloc[i][j];
		}
	}
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * copy:
 *
 * Vector copy. vec0 <-- vec1.
 */
void copy(float vec0[3], float vec1[3])
{
	vec0[0] = vec1[0];
	vec0[1] = vec1[1];
	vec0[2] = vec1[2];
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * sub:
 *
 * Vector subtraction. vec0 <-- vec1 - vec2.
 */
void sub(float vec0[3], float vec1[3], float vec2[3])
{
	vec0[0] = vec1[0] - vec2[0];
	vec0[1] = vec1[1] - vec2[1];
	vec0[2] = vec1[2] - vec2[2];
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * add:
 *
 * Vector addition. vec0 <-- vec1 + vec2.
 */
void add(float vec0[3], float vec1[3], float vec2[3])
{
	vec0[0] = vec1[0] + vec2[0];
	vec0[1] = vec1[1] + vec2[1];
	vec0[2] = vec1[2] + vec2[2];
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * scalDiv:
 *
 * Scalar division. vec <-- vec / c.
 */
void scalDiv(float vec[3], float c)
{
	vec[0] /= c;
	vec[1] /= c;
	vec[2] /= c;
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * cross:
 *
 * Vector cross product. vec0 <-- vec1 x vec2.
 */
void cross(float vec0[3], float vec1[3], float vec2[3])
{
	vec0[0] = vec1[1]*vec2[2] - vec2[1]*vec1[2];
	vec0[1] = vec1[0]*vec2[2] - vec2[0]*vec1[2];
	vec0[2] = vec1[0]*vec2[1] - vec2[0]*vec1[1];
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * norm:
 *
 * Vector normalization. vec <-- vec / length(vec).
 */
void norm(float vec[3])
{
	float mag = sqrt(vec[0]*vec[0] + vec[1]*vec[1] + vec[2]*vec[2]);
	vec[0] = vec[0]/mag;
	vec[1] = vec[1]/mag;
	vec[2] = vec[2]/mag;
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * set:
 *
 * Vector initialization. vec <-- (x,y,z).
 */
void set(float vec[3], float x, float y, float z)
{
	vec[0] = x;
	vec[1] = y;
	vec[2] = z;
}


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * getFaceNorms:
 *
 * Eval normals at each triangular facet for flat shading.
 * Init FaceNorms[0|1][i][j] with face normals, where 0 and 1 refer
 * to the two triangular faces in a 2x2 neighborhood of mesh nodes (+):
 * +--+
 * |\0|
 * |1\|
 * +--+
 * (i,j) refer to mesh node (i,j), where 0 <= i < Grid-1 and 0 <= j < Grid-1.
 */


/*
 
	for(i=0; i<Grid-1; i++) {
		glBegin(GL_TRIANGLE_STRIP);
		glVertex3f( i , 0., Posit[ i ][0]);
		glVertex3f(i+1, 0., Posit[i+1][0]);
		for(j=1; j<Grid; j++) {
			glNormal3fv(FaceNorms[0][i][j-1] );
			glVertex3f ( i,  j, Posit[i][ j ]);
			glNormal3fv(FaceNorms[1][i][j-1] );
			glVertex3f (i+1, j, Posit[i+1][j]);
		}
		glEnd();
	}

 */

void getFaceNorms(void)
{
	float p0[3], p1[3], p2[3], p3[3], n[3], t0[3], t1[3];
  int i, j;	
  for(i=0; i<Grid-1; i++) {
		for(j=1; j<Grid; j++) {

      set(p0, i, j, Posit[i][j]);
      set(p1, i + 1, j, Posit[i+1][j]);
      set(p2, i + 1, j + 1, Posit[i+1][j+1]);
      set(p3, i, j + 1, Posit[i][j+1]);
			
      // Facet 0
      sub(t0, p1, p0);
      sub(t1, p2, p0);
      cross(n, t0, t1);
      norm(n);

      set(FaceNorms[0][i][j-1], n[0], n[1], n[2]);
			
      // Facet 1
      sub(t0, p2, p0);
      sub(t1, p3, p0);
      cross(n, t0, t1);
      norm(n);

      set(FaceNorms[1][i][j-1], n[0], n[1], n[2]);
		}
  }
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * getVertNorms:
 *
 * Initialize vertNorms[i][j] with vertex normals.
 * The normal at a vertex is computed as the average of the neighboring
 * face normals. This is to be used for smooth shading.
 */
void getVertNorms(void)
{
	//...
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * getFaceNormSegs:
 *
 * Initialize FaceNormSegs[0|1][0|1][i][j] with vertex normals.
 * The first  index refers to the face number.
 * The second index refers to the face center (0) or face normal (1).
 */
void getFaceNormSegs(void)
{
	int	i, j;
	float	center0[3], center1[3];
	float	geom0  [3], geom1  [3], geom2   [3], geom3   [3];

	for(i=0; i<Grid-1; i++) {
	    for(j=0; j<Grid-1; j++) {
		/* init vectors from geometry points */
		geom0[0] = i;   geom0[1] = j;   geom0[2] = Posit[i][j];
		geom1[0] = i;   geom1[1] = j+1; geom1[2] = Posit[i][j+1];
		geom2[0] = i+1; geom2[1] = j;   geom2[2] = Posit[i+1][j];
		geom3[0] = i+1; geom3[1] = j+1; geom3[2] = Posit[i+1][j+1];

		/* center0 <- center of triangle face 0; avg three vertices */
		add(center0,   geom2, geom0);
		add(center0, center0, geom1);
		scalDiv(center0, 3.0);

		/* center1 <- center of triangle face 1; avg three vertices */
		add(center1,   geom2, geom1);
		add(center1, center1, geom3);
		scalDiv(center1, 3.0);

		/* translate normal to center of face to get normal segment;
		 * FaceNormSegs[0 or 1][0][i][j] <- center of face 0 or 1
		 * FaceNormSegs[0 or 1][1][i][j] <- translated face norm
		 */

		copy(FaceNormSegs[0][0][i][j], center0);
		copy(FaceNormSegs[1][0][i][j], center1);

		add (FaceNormSegs[0][1][i][j], center0, FaceNorms[0][i][j]);
		add (FaceNormSegs[1][1][i][j], center1, FaceNorms[1][i][j]);
	    }
	}
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * getTexCoords:
 *
 * Initialize TexCoords[i][j][0|1] with texture coordinates.
 */
void getTexCoords(void)
{
	int	i, j;

	for(i=0; i<Grid; i++) {
		for(j=0; j<Grid; j++) {
			TexCoords[i][j][0] = (float) j/(Grid-1);
			TexCoords[i][j][1] = (float) i/(Grid-1);
		}
	}
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * wave:
 *
 * If Waving is set, compute new geometry and redisplay.
 */
void wave(void)
{
	if (Waving) {
		getForce();
		getVelocity();
		getPosition();
		glutPostRedisplay();
	}
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * go:
 *
 * Set Waving to TRUE to start waving sequence.
 */
void go(void)
{
	Waving = TRUE;
	Editing = FALSE;
	glutIdleFunc(wave);
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * stop:
 *
 * Set Waving to FALSE to stop waving sequence.
 */
void stop(void)
{
	Waving = FALSE;
	glutIdleFunc(NULL);
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * edit:
 *
 * Stop sequence and set Editing to TRUE.
 */
void edit(void)
{
	stop();
	Editing = TRUE;
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * reverse:
 *
 * Make waving motion go in reverse.
 */
void reverse(void)
{
	int	i, j;

	for(i=1; i<Grid-1; i++)
		for(j=1; j<Grid-1; j++)
			Veloc[i][j] = -Veloc[i][j];

	if (!Waving) go();
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * reset:
 *
 * Reset geometry (menu item).
 */
void reset(int value)
{
	int	i, j;

	if(Waving) stop();
	if(value != CURRENT) ResetMode = value;

	for(i=0; i<Grid; i++) {
	    for(j=0;j<Grid;j++) {
		Force[i][j]=0.0;
		Veloc[i][j]=0.0;

		switch(ResetMode) {
		case FLAT:
			Posit[i][j] = 0.0;
			break;
		case SPIKE:
			Posit[i][j]= (i==j && i == Grid/2) ? Grid*1.5 : 0.0;
			break;
		case HOLE:
			Posit[i][j]= (!((i > Grid/3 && j > Grid/3)&&(i < Grid*2/3 && j < Grid*2/3))) ? Grid/4 : 0.0;
			break;
		case DIAGONALWALL:
			Posit[i][j]= (((Grid-i)-j<3) && ((Grid-i)-j>0)) ? Grid/6 : 0.0;
			break;
		case SIDEWALL:
			Posit[i][j]= (i==1) ? Grid/4 : 0.0;
			break;
		case DIAGONALBLOCK:
			Posit[i][j]= ((Grid-i)-j<3) ? Grid/6 : 0.0;
			break;
		case MIDDLEBLOCK:
			Posit[i][j]= ((i > Grid/3 && j > Grid/3)&&(i < Grid*2/3 && j < Grid*2/3)) ? Grid/4 : 0.0;
			break;
		case CORNERBLOCK:
			Posit[i][j]= ((i > Grid*3/4 && j > Grid*3/4)) ? Grid/4 : 0.0;
			break;
		case HILL:
			Posit[i][j]= (sin(PII * ((float)i/(float)Grid)) +
			  sin(PII * ((float)j/(float)Grid)))* Grid/6.0;
			break;
		case HILLFOUR:
			Posit[i][j]= (sin(PII*2 * ((float)i/(float)Grid)) +
				sin(PII*2 * ((float)j/(float)Grid)))* Grid/6.0;
			break;
		}
		if(i==0 || j==0 || i==Grid-1 || j==Grid-1) Posit[i][j]=0.0;
	    }
	}
	glutPostRedisplay();
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * setSize:
 *
 * Set grid size (menu item).
 */
void setSize(int value)
{
	int prevGrid = Grid;

	switch(value) {
		case SMALL : Grid = MAXGRID/4;	 break;
		case MEDIUM: Grid = MAXGRID/2;	 break;
		case LARGE : Grid = MAXGRID/1.5; break;
		case XLARGE: Grid = MAXGRID;     break;
	}

	if(prevGrid > Grid) reset(ResetMode);

	ZNear = Grid/10.0;
	ZFar  = Grid*3.0;
	Sdepth = 5.0/4.0 * Grid;
	getTexCoords();
	glutPostRedisplay();
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * setSpeed:
 *
 * Set speed (menu item).
 */
void setSpeed(int value)
{
	switch(value) {
		case WEAK  : Dt = 0.001; break;
		case NORMAL: Dt = 0.004; break;
		case STRONG: Dt = 0.008; break;
	}
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * setDisplay:
 *
 * Set display mode (menu item).
 */
void setDisplay(int value)
{
	DisplayMode = value;
	switch(value) {
	case WIREFRAME   : 
		glShadeModel(GL_FLAT); 
		glDisable(GL_LIGHTING);
		break;
	case HIDDENLINE: 
		glShadeModel(GL_FLAT); 
		glDisable(GL_LIGHTING);
		break;
	case FLATSHADED  : 
		glShadeModel(GL_FLAT); 
		glEnable(GL_LIGHTING);
		break;
	case SMOOTHSHADED: 
		glShadeModel(GL_SMOOTH); 
		glEnable(GL_LIGHTING);
		break;
	case TEXTURED: 
		glShadeModel(GL_SMOOTH); 
		glEnable(GL_LIGHTING);
		break;
	}
	glutPostRedisplay();
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * setOther:
 *
 * Set other mode (menu item).
 */
void setOther(int value)
{
	switch (value) {
	case FULLSCREEN: 
		glutFullScreen();
		break;
	case FACENORMALS: 
	        DrawFaceNorms = !DrawFaceNorms;
	        break;
	case ANTIALIAS: 
	        Antialias = !Antialias;
	        if (Antialias) {
	            glEnable(GL_BLEND);
	            glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	            glEnable(GL_LINE_SMOOTH);
	            glLineWidth(1.5);
	        } else {
	            glDisable(GL_BLEND);
	            glDisable(GL_LINE_SMOOTH);
	            glLineWidth(1.0);
	        }
	        break;
	    case ENVMAP: 
	        EnvMap = !EnvMap;
	        if(EnvMap) {
	            glBindTexture(GL_TEXTURE_2D, TexId2);
	            glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_DECAL);
	            glTexGeni(GL_S, GL_TEXTURE_GEN_MODE, GL_SPHERE_MAP);
	            glTexGeni(GL_T, GL_TEXTURE_GEN_MODE, GL_SPHERE_MAP);
	            glEnable(GL_TEXTURE_GEN_S);
	            glEnable(GL_TEXTURE_GEN_T);
	        }
	        else
	        {
	            glBindTexture(GL_TEXTURE_2D, TexId1);
	            glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	            glDisable(GL_TEXTURE_GEN_S);
	            glDisable(GL_TEXTURE_GEN_T);
	        }
	        break;
	}
	glutPostRedisplay();
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * setMain:
 *
 * Set main operations (menu item).
 */
void setMain(int value)
{
	switch(value) {
	case 1: edit();    break;
	case 2:   go();    break; /* set idle func to something */
	case 3: stop();    break; /* set idle func to null */
	case 4: reverse(); break;
	case 5: exit(0);   break;
    }
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * drawFaceNormals:
 *
 * Draw face normals on all triangular faces.
 */
void drawFaceNormals(void)
{
	int	i, j;
	glColor3f(1.0,1.0,1.0);

	for(i=0; i<Grid-1; i++) {
		for(j=0; j<Grid-1; j++) {
			glBegin(GL_LINES);
			glVertex3fv(FaceNormSegs[0][0][i][j]);
			glVertex3fv(FaceNormSegs[0][1][i][j]);
			glEnd();

			glBegin(GL_LINES);
			glVertex3fv(FaceNormSegs[1][0][i][j]);
			glVertex3fv(FaceNormSegs[1][1][i][j]);
			glEnd();
		}
	}
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * drawSmoothShaded:
 *
 * Draw smooth shaded surface.
 */
void drawSmoothShaded(void)
{
	int	i, j;

	/* set color to (.8,.2,.8) */
	//...

	/* draw triangular strip; include normal data with each vertex */ 
	
	for(i=0; i<Grid-1; i++) {
		glBegin(GL_TRIANGLE_STRIP);
		glVertex3f( i , 0., Posit[ i ][0]);
		glVertex3f(i+1, 0., Posit[i+1][0]);
		for(j=1; j<Grid; j++) {
			glNormal3fv(FaceNorms[0][i][j-1] );
			glVertex3f ( i,  j, Posit[i][ j ]);
			glNormal3fv(FaceNorms[1][i][j-1] );
			glVertex3f (i+1, j, Posit[i+1][j]);
		}
		glEnd();
  }
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * drawWireframe:
 *
 * Draw wire frame surface.
 */
void drawWireframe(void)
{
	int	i, j;

	/* set color to white */
	glColor3f(1.0, 1.0, 1.0);

	/* draw line strip to draw rows */
	for(i=0; i<Grid; i++) {
		glBegin(GL_LINE_STRIP);
		for(j=0; j<Grid; j++)
			glVertex3f(i, j, Posit[i][j]);
		glEnd();
	}

	/* draw line strip to draw columns */
	for(i=0; i<Grid; i++) {
		glBegin(GL_LINE_STRIP);
		for(j=0; j<Grid; j++)
			glVertex3f(j, i, Posit[j][i]);
		glEnd();
	}
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * drawFlatShaded:
 *
 * Draw flat shaded surface.
 */
void drawFlatShaded(void)
{
	int	i, j;

	/* enable GL_POLYGON_OFFSET_FILL and set color to (.8,.2,.8) */
	glEnable (GL_POLYGON_OFFSET_FILL);
	glColor3f(0.8, 0.2, 0.8);

	/* draw triangular strip; include normal data with each vertex */ 
	for(i=0; i<Grid-1; i++) {
		glBegin(GL_TRIANGLE_STRIP);
		glVertex3f( i , 0., Posit[ i ][0]);
		glVertex3f(i+1, 0., Posit[i+1][0]);
		for(j=1; j<Grid; j++) {
			glNormal3fv(FaceNorms[0][i][j-1] );
			glVertex3f ( i,  j, Posit[i][ j ]);
			glNormal3fv(FaceNorms[1][i][j-1] );
			glVertex3f (i+1, j, Posit[i+1][j]);
		}
		glEnd();
	}

	/* reset  GL_POLYGON_OFFSET_FILL */
	glDisable(GL_POLYGON_OFFSET_FILL);
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * drawHiddenLine:
 *
 * Draw hidden line surface.
 */
void drawHiddenLine(void)
{
	int	i, j;

	/* enable GL_POLYGON_OFFSET_FILL and set color to (.8,.2,.8) */
	//...
  glEnable(GL_POLYGON_OFFSET_FILL);
  glColor3f(0.8, 0.2, 0.8);

	/* draw triangular strip of constant colors triangles (filled) */
	glPolygonMode(GL_FRONT, GL_FILL);
   
	for(i=0; i<Grid-1; i++) {
		glBegin(GL_TRIANGLE_STRIP);
		glVertex3f( i , 0., Posit[ i ][0]);
		glVertex3f(i+1, 0., Posit[i+1][0]);
		for(j=1; j<Grid; j++) {
			//glNormal3fv(FaceNorms[0][i][j-1] );
			glVertex3f ( i,  j, Posit[i][ j ]);
			//glNormal3fv(FaceNorms[1][i][j-1] );
			glVertex3f (i+1, j, Posit[i+1][j]);
		}
   glEnd();
  }

	/* set color to white (for lines in triangular mesh) */
	glColor3f(1.0, 1.0, 1.0);

	/* draw triangular mesh lines */
  glDisable(GL_POLYGON_OFFSET_FILL);
  glPolygonMode(GL_FRONT, GL_LINE);
	for(i=0; i<Grid-1; i++) {
		glBegin(GL_TRIANGLE_STRIP);
		glVertex3f( i , 0., Posit[ i ][0]);
		glVertex3f(i+1, 0., Posit[i+1][0]);
		for(j=1; j<Grid ; j++) {
			//glNormal3fv(FaceNorms[0][i][j-1] );
			glVertex3f ( i,  j, Posit[i][ j ]);
			//glNormal3fv(FaceNorms[1][i][j-1] );
			glVertex3f (i+1, j, Posit[i+1][j]);
		}
		glEnd();
  }
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * loadImageTexture:
 *
 * Load texture and environment map images.
 * Set GL_TEXTURE_WRAP_S and GL_TEXTURE_WRAP_T to GL_CLAMP.
 * Set GL_TEXTURE_MAG_FILTER and GL_TEXTURE_MIN_FILTER to GL_LINEAR.
 * The images that are read in are in GL_RGBA (4-byte/pixel) format.

 int	 TexWidth, TexHeight;
int	 TexId1,   TexId2;
GLubyte *TexData;
char	*TexFilename1 = "texmap.rgb";
char	*TexFilename2 = "envmap.rgb";
float	 TexCoords[MAXGRID][MAXGRID][2];

 */
void loadImageTexture(void)
{
    
	GLfloat borderColor[] = {0, 0, 0, 0};  // Black and opaque

	GLubyte *texmapImg;
	GLubyte *envmapImg;

	imgLoad(TexFilename1, 0, borderColor, &TexWidth, &TexHeight, &texmapImg);

	glBindTexture(GL_TEXTURE_2D, TexId1);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, TexWidth, TexHeight, 0, GL_RGBA, GL_UNSIGNED_BYTE, texmapImg);

	imgLoad(TexFilename2, 0, borderColor, &TexWidth, &TexHeight, &envmapImg);

	glBindTexture(GL_TEXTURE_2D, TexId2);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexImage2D(GL_TEXTURE_2D, 0, 3, TexWidth, TexHeight, 0, GL_RGBA, GL_UNSIGNED_BYTE, envmapImg);

}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * drawTextured:
 *
 * Draw textured surface.
 */
void drawTextured(void)
{
  int i, j;
	glEnable(GL_TEXTURE_2D);

	/* draw triangular strip; add normal/texture data with each vertex */ 
	
	for(i=0; i<Grid-1; i++) {
		glBegin(GL_TRIANGLE_STRIP);
    
        if(i == 0) 
            glTexCoord2f(0.0, 1.0); // Bottom Left
		    glVertex3f( i , 0., Posit[ i ][0]);
        if((i + 1) == Grid)
            glTexCoord2f(1.0, 1.0); // Bottom Right
		    glVertex3f(i+1, 0., Posit[i+1][0]);
		    for(j=1; j<Grid; j++) {
			      //glNormal3fv(FaceNorms[0][i][j-1] );
            if(j == Grid && i == 0) 
                glTexCoord2f(0.0, 0.0); // Top left
			      glVertex3f ( i,  j, Posit[i][ j ]);
			      //glNormal3fv(FaceNorms[1][i][j-1] );
            if(j == Grid && (i + 1) == Grid)
                glTexCoord2f(1.0, 0.0); // Top right
			      glVertex3f (i+1, j, Posit[i+1][j]);
		    }
		glEnd();
  }


	glDisable(GL_TEXTURE_2D);
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * reshape:
 *
 * Reshape callback function.
 */
void reshape(int width, int height)
{
	Xsize  = width; 
	Ysize  = height;
	Aspect = (float) Xsize / Ysize;
	glViewport(0, 0, Xsize,  Ysize);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glutPostRedisplay();
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * display:
 *
 * Display callback function.
 */
void display(void) 
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(64.0, Aspect, ZNear, ZFar);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity(); 

	glTranslatef(0.0,0.0,-Sdepth);
	glRotatef(-Theta, 1.0, 0.0, 0.0);
	glRotatef(   Phi, 0.0, 0.0, 1.0);
	glTranslatef(-((Grid+1)/2.-1), -((Grid+1)/2.-1), 0.0);

	getFaceNorms();
	getVertNorms();

	switch (DisplayMode) {
		case WIREFRAME:	   drawWireframe();	break;
		case HIDDENLINE:   drawHiddenLine();	break;
		case FLATSHADED:   drawFlatShaded();	break;
		case SMOOTHSHADED: drawSmoothShaded();	break;
		case TEXTURED:     drawTextured();	break;
	}

	if (DrawFaceNorms) {
		getFaceNormSegs();
		drawFaceNormals();
	}

	glutSwapBuffers();
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * visibility:
 *
 * Visibility callback function.
 */

void visibility(int state)
{
	if((state == GLUT_VISIBLE) && Waving) go();
	else stop();
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * motion:
 *
 * Motion callback function.
 */
void motion(int x, int y)
{
	if (LeftButton) {
		Phi   += (float)(x - DownX) / 4.0;
		Theta += (float)(DownY - y) / 4.0;
	}

	if (MiddleButton)
		Sdepth += (float)(DownY - y) / 10.0;

	DownX = x;
	DownY = y;
	glutPostRedisplay();
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * mouse:
 *
 * Mouse callback function.
 */
void mouse(int button, int state, int x, int y)
{
	DownX = x;
	DownY = y;
	LeftButton = ((button == GLUT_LEFT_BUTTON) && 
	              (state == GLUT_DOWN));
	MiddleButton = ((button == GLUT_MIDDLE_BUTTON) && 
	                (state == GLUT_DOWN));
}



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * keyboard:
 *
 * Keyboard callback function.
 */
void keyboard(unsigned char ch, int x, int y)
{
	switch (ch) {
        case '+': Sdepth += 2.0; break;
        case '-': Sdepth -= 2.0; break;
        case 27 : exit(0);	 break;
	}
	glutPostRedisplay();
}

void main(int argc, char **argv)
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(500, 500);
	glutCreateWindow("wave");
	if(argc > 1 && argv[1] != 0) TexFilename1 = argv[1];
	if(argc > 2 && argv[2] != 0) TexFilename2 = argv[2];
	glEnable	(GL_DEPTH_TEST);
	glDepthFunc	(GL_LEQUAL);
	glClearColor	(0.0, 0.0, 0.0, 0.0);
	glPolygonOffset	(1.0, 1.0);
	glEnable	(GL_CULL_FACE);
	glHint		(GL_LINE_SMOOTH_HINT, GL_NICEST);
	glHint		(GL_POLYGON_SMOOTH_HINT, GL_NICEST);
	glHint		(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
	glEnable	(GL_COLOR_MATERIAL);
	glColorMaterial	(GL_FRONT, GL_DIFFUSE);
	glLightfv	(GL_LIGHT0, GL_POSITION, lightPosition);
	glEnable	(GL_LIGHT0);
	loadImageTexture();

	setSize	  (MEDIUM);
	setSpeed  (NORMAL);
	setDisplay(FLATSHADED);
	setOther  (ENVMAP);
	reset	  (HILLFOUR);

	glutReshapeFunc(reshape);
	glutDisplayFunc(display);
	glutVisibilityFunc(visibility);

	glutKeyboardFunc(keyboard);
	glutMouseFunc   (mouse);
	glutMotionFunc  (motion);

	displayMenu = glutCreateMenu(setDisplay);
	glutAddMenuEntry("Wireframe",     WIREFRAME);
	glutAddMenuEntry("Hidden Line",   HIDDENLINE);
	glutAddMenuEntry("Flat Shaded",   FLATSHADED);
	glutAddMenuEntry("Smooth Shaded", SMOOTHSHADED);
	glutAddMenuEntry("Textured",      TEXTURED);

	otherMenu = glutCreateMenu(setOther);
	glutAddMenuEntry("Full Screen",  FULLSCREEN);
	glutAddMenuEntry("Face Normals", FACENORMALS);
	glutAddMenuEntry("Antialias",    ANTIALIAS);
	glutAddMenuEntry("Environment Map", ENVMAP);

	speedMenu = glutCreateMenu(setSpeed);
	glutAddMenuEntry("Weak",   WEAK);
	glutAddMenuEntry("Normal", NORMAL);
	glutAddMenuEntry("Strong", STRONG);

	sizeMenu = glutCreateMenu(setSize);
	glutAddMenuEntry("Small",  SMALL);
	glutAddMenuEntry("Medium", MEDIUM);
	glutAddMenuEntry("Large",  LARGE);
	glutAddMenuEntry("Extra Large", XLARGE);

	resetMenu = glutCreateMenu(reset);
	glutAddMenuEntry("Current",	  CURRENT);
	glutAddMenuEntry("Spike",	  SPIKE);
	glutAddMenuEntry("Hole",	  HOLE);
	glutAddMenuEntry("Diagonal Wall", DIAGONALWALL);
	glutAddMenuEntry("Side Wall",     SIDEWALL);
	glutAddMenuEntry("Middle Block",  MIDDLEBLOCK);
	glutAddMenuEntry("Diagonal Block",DIAGONALBLOCK);
	glutAddMenuEntry("Corner Block",  CORNERBLOCK);
	glutAddMenuEntry("Hill",          HILL);
	glutAddMenuEntry("Hill Four",     HILLFOUR);

	mainMenu = glutCreateMenu(setMain);
	glutAddMenuEntry("Go",      2);
	glutAddMenuEntry("Stop",    3);
	glutAddMenuEntry("Reverse", 4);
	glutAddSubMenu("Display",   displayMenu);
	glutAddSubMenu("Reset",     resetMenu);
	glutAddSubMenu("Size",      sizeMenu);
	glutAddSubMenu("Speed",     speedMenu);
	glutAddSubMenu("Other",     otherMenu);
	glutAddMenuEntry("Exit",    5);
	glutAttachMenu(GLUT_RIGHT_BUTTON);

	glutMainLoop();
}
