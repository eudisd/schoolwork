#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#include "lib/iter.h"
#include "lib/ptr.h"
int main(void){
    struct timeval t1, t2, t3, t4;

    gettimeofday(&t1, NULL);
    iter();
    gettimeofday(&t2, NULL);

    gettimeofday(&t3, NULL);
    ptr();
    gettimeofday(&t4, NULL);

    printf("Unoptimized Iter() function call: %d.%06d\n", 
            t2.tv_sec - t1.tv_sec, t2.tv_usec - t1.tv_usec);

    printf("Unoptimized Ptr() function call: %d.%05d\n",
            t4.tv_sec - t3.tv_sec, t4.tv_usec - t3.tv_usec);
    return 0;
}
