#include <stdio.h>

#ifndef P1
#define P1

int printthings1(char* z){
return printf("%s", z);
}

#endif

#ifndef P1
int printthings1(char* z){
    return printf("%s", z);
}

#endif

int main(){
    char y[6] = "jajaj";
    char* z = y;
    printthings1(z);
    printthings1(y);
    return 0;
}
