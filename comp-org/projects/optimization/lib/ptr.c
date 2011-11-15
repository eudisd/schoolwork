#include "ptr.h"

void ptr(void){
    char array[10];
    char *p = array;
    for(;p < &array[10];){
        *p++ = 0;
    }
}
