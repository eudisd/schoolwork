#include "ptr.h"

void ptr(void){
    char array[1000000];
    char *p = array;
    for(;p < &array[1000000];){
        *p++ = 0;
    }
}
