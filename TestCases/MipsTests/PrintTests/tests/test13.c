#include <stdio.h>

int main(){
    int a = 3;
    char* b = "hello";
    int c = 255;
    float d = 3.14;
    char e = 'c';
    printf(" %d \n %s \n %x \n %d \n %c", a,b,c, (int) d,e);
    return 0;
}