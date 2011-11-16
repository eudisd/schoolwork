
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#include "lib/iter.h"
#include "lib/ptr.h"

#define RANGE 8000

double microsecs(void);

int main(void){
    double t1, t2, diff;

    int i;
    for(i = 0; i < RANGE; i++){
        t1 = microsecs();
        iter();
        t2 = microsecs();
        diff = diff + (t2 - t1);
    }
    diff /= (double)RANGE;
    
    printf("Unoptimized iter() function call: %0.10f\n", diff);
   
    for(i = 0; i < RANGE; i++){
        t1 = microsecs();
        ptr();
        t2 = microsecs();
        diff = diff + (t2 - t1);
    }

    
    printf("Unoptimized ptr() function call: %0.10f\n", diff);

    // Optimized versions of these functinos 
    
    opt_t1 = microsecs();
    opt_iter();
    opt_t2 = microsecs();

    opt_t3 = microsecs();
    opt_ptr();
    opt_t4 = microsecs();




    printf("Unoptimized opt_iter() function call: %0.10f\n", opt_t2 - opt_t1);
    printf("Unoptimized opt_ptr() function call: %0.10f\n", opt_t4 - opt_t3);
    
    */
    return 0;
}

double microsecs(){
    static struct timeval _t;
    static struct timezone tz;
    gettimeofday(&_t, &tz);
    return (double)_t.tv_sec + (double)_t.tv_usec/(1000*1000);
    
}
