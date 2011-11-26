#include "ptr.h"

void ptr(void){
    int array[1000000];
    int *p = array;
    for(;p < &array[1000000];){
        *p++ = 0;
    }
}
