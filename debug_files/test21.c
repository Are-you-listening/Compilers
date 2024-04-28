#include <stdio.h>

int main(){
    int a = 0;
    int* c[1] = {&a};
    printf("%d", *c[0]);
    return 0;
}