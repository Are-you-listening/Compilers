#include <stdio.h>

int main(){

    int a = 6;
    a = 6;
    int b = 2;
    b = 2;

    int c = a + b;
    printf("%d", c);
    int d = a - b;
    printf("%d", d);
    int e = a * b;
    printf("%d", e);
    int f = a / b;
    printf("%d", f);

    int g = a == b;
    printf("%d", g);
    int h = a < b;
    printf("%d", h);
    int i = a > b;
    printf("%d", i);

    int j = a != b;
    printf("%d", j);
    int k = a <= b;
    printf("%d", k);
    int l = a >= b;
    printf("%d", l);

    int m = a % b;
    printf("%d", m);

    int n = a << b;
    printf("%d", n);

    int o = a >> b;
    printf("%d", 0);

    return 0;
}