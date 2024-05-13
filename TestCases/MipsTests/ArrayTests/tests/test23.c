#include <stdio.h>

int main(){
    int a = 1;
    int* c[1] = {&a};
    int** t = c;
    printf("%d", **t);
    return 0;
}