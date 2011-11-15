#include "ptr.h"

void ptr(void){
    char array[10];
    char *p = array;
    while(p < &array[10]){
        *p = 0;
        p++;
    }
}
