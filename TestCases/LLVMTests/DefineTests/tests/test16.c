#include <stdio.h>

#ifndef P1
int printthings1(char* z){
return printf("%s", "printthings1");
}

#endif

#ifndef P1
int printthings1(char* z){
    return printf("%s", "printthings1");
}

#endif



int main(){
    printthings1("jajaj");
    return 0;
}
