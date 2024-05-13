#include <stdio.h>

int main(){

    int a = 6;
    a = 6;

    int b = +a;
    printf("%d", b);
    b = -a;
    printf("%d", b);

    return 0;
}