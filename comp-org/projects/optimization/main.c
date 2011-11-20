#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#include "lib/iter.h"
#include "lib/ptr.h"

double microsecs(void);            // Returns the current time.
double getdiff(void(*func)(void)); // Returns the measured time 
								   // difference function call.

const int RANGE = 10;              // Average function call time
double t1, t2, diff = 0; 
int i;							   // Global iterator

int main(void){

	// Unoptimized versions 
	diff = getdiff(iter);
    printf("Unoptimized iter() function call time: \n%0.10f secs\n", diff);
    diff = getdiff(ptr);
    printf("Unoptimized ptr() function call time: \n%0.10f secs\n", diff);

    // Optimized versions of these functinos 
    
    diff = getdiff(opt_iter);
    printf("Optimized opt_iter() function call time: \n%0.10f secs\n", diff);
    diff = getdiff(opt_ptr);
    printf("Optimized opt_ptr() function call time: \n%0.10f secs\n", diff);
    
    return 0;
}

double microsecs(){
    static struct timeval _t;
    static struct timezone tz;
    gettimeofday(&_t, &tz);
    return (double)_t.tv_sec + (double)_t.tv_usec/(1000*1000);
    
}

double getdiff(void(*func)(void)){
	for(i = 0, diff = 0.0; i < RANGE; i++){
        t1 = microsecs();
        func();
        t2 = microsecs();
        diff = diff + (t2 - t1);
    }
	return diff /= (double)RANGE;
}
