#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#include "lib/iter.h"
#include "lib/ptr.h"

double microsecs(void);

int main(void){
    double t1, t2, t3, t4,
           opt_t1, opt_t2, opt_t3, opt_t4;


//    opt_iter();


    t1 = microsecs();
    iter();
    t2 = microsecs();

    t3 = microsecs();
    ptr();
    t4 = microsecs();

    printf("Unoptimized Iter() function call: %f\n", t2 - t1);
    printf("Unoptimized Ptr() function call: %f\n", t4 - t3);

    
    
    return 0;
}

double microsecs(){
    static struct timeval _t;
    static struct timezone tz;
    gettimeofday(&_t, &tz);
    return (double)_t.tv_sec + (double)_t.tv_usec/(1000000);
}
