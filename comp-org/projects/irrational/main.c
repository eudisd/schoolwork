#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(void){

    double avg, res, root, guess, tol = 0.000000000000001;
    
    root = 2.0;
    guess = 1.2;

    avg = (guess + root)/2.0;
    res = avg;
    while(fabs(avg - guess) > tol){
        
        printf("Radicant: %2.16f\n Average: %f\n Guess: %2.16f Diff: %2.16f\n\n", root, avg, guess, fabs(guess- avg));
        avg = (guess + avg)/2.0;
        guess = avg;
        avg = res;
        res = guess;
    
    }
    return 0;
}
