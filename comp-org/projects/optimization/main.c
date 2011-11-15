#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#include "lib/iter.h"
#include "lib/ptr.h"

double microsecs(void);

int main(void){
    double t1, t2, t3, t4,
           opt_t1, opt_t2, opt_t3, opt_t4;


    t1 = microsecs();
    iter();
    t2 = microsecs();

    t3 = microsecs();
    ptr();
    t4 = microsecs();


    // Optimized versions of these functinos 
    
    opt_t1 = microsecs();
    opt_iter();
    opt_t2 = microsecs();

    opt_t3 = microsecs();
    opt_ptr();
    opt_t4 = microsecs();

    printf("Unoptimized iter() function call: %0.10f\n", t2 - t1);
    printf("Unoptimized ptr() function call: %0.10f\n", t4 - t3);

    printf("Unoptimized opt_iter() function call: %0.10f\n", opt_t2 - opt_t1);
    printf("Unoptimized opt_ptr() function call: %0.10f\n", opt_t4 - opt_t3);
    
    
    return 0;
}

double microsecs(){
    struct timeval _t;
    struct timezone tz;
    gettimeofday(&_t, &tz);
    return (double)_t.tv_sec + (double)_t.tv_usec/(1000*1000);
}
