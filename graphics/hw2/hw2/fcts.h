
#ifndef _FCTS_H_
#define _FCTS_H_

// macros
#define CLIP(A,L,H)	((A)<=(L) ? (L) : (A)<=(H) ? (A) : (H))


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// init:
//
// Initialization routine before display loop.
//
void init(void);

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// display:
//
// Display handler routine.
//
void display(void);

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// readPPM:
//
// Read a PPM file.
// Pass back dimensions and image pointer in width, height, and image.
// Return 1 for success, or 0 for failure.
//
int readPPM(char *file, int &width, int &height, unsigned char* &image);

#endif