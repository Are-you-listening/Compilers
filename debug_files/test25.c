#include <stdio.h>

int m(int a){
    return 5;
}

int main () {

    int (*v)(float) = 0;

    int b = v(5);
    printf("%d", b);

    return 0;
}