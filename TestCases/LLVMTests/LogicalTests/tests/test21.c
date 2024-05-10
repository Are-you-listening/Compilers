#include <stdio.h>

int main(){

    int a = 0;
    a = 0;

    int b = 5;
    b = 5;

    int c = 3;
    c = 3;

    int d = (a || b) && c; /*Explain using CFG*/
    printf("%d", d);

    int e = !a;
    printf("%d", e);

    int f = a & b;
    printf("%d", f);
    int g = a | b;
    printf("%d", g);
    int h = a ^ b;
    printf("%d", h);
    int i = ~a;
    printf("%d", i);

    return 0;
}