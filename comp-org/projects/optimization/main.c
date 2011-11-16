
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#include "lib/iter.h"
#include "lib/ptr.h"

#define RANGE 8000000

__uint64_t rdtsc();
double microsecs(void);

int main(void){
    __uint64_t t1, t2, diff = 0;

    int i;
    for(i = 0; i < RANGE; i++){
        t1 = rdtsc();
        iter();
        t2 = rdtsc();
        diff = diff + (t2 - t1);
    }
    diff /= (__uint64_t)RANGE;
    
    printf("Unoptimized iter() function call: %u\n", diff);
    for(i = 0, diff = 0; i < RANGE; i++){
        t1 = rdtsc();
        ptr();
        t2 = rdtsc();
        diff = diff + (t2 - t1);
    }

    diff /= (__uint64_t)RANGE;
    printf("Unoptimized ptr() function call: %u\n", diff);

    // Optimized versions of these functinos 
    
    for(i = 0, diff = 0; i < RANGE; i++){
        t1 = rdtsc();
        opt_iter();
        t2 = rdtsc();
        diff = diff + (t2 - t1);
    }
    diff /= (__uint64_t)RANGE;
    printf("Unoptimized opt_iter() function call: %u\n", diff);
    
    for(i = 0, diff = 0; i < RANGE; i++){
        t1 = rdtsc();
        opt_ptr();
        t2 = rdtsc();
        diff = diff + (t2 - t1);
    }
    diff /= (__uint64_t)RANGE;
    printf("Unoptimized opt_ptr() function call: %u\n", diff);
    
    return 0;
}
inline __uint64_t rdtsc(){
    __uint32_t lo, hi;
    asm volatile (
            "xorl %%eax, %%eax\n"
            "cpuid\n"
            "rdtsc\n"
            : "=a" (lo), "=d" (hi)
            :
            : "%ebx", "%ecx");
    return (long)hi << 32 | lo;

}
double microsecs(){
    static struct timeval _t;
    static struct timezone tz;
    gettimeofday(&_t, &tz);
    return (double)_t.tv_sec + (double)_t.tv_usec/(1000*1000);
    
}
