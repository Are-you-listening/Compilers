#include <stdio.h>

int main(){
    const char a = 'a';
    printf("%c", a);
    const int b = a;
        printf("%d", b);

    const float c = b;
        printf("%f", c);

    const int d = c+b+a;
        printf("%d", d);

    const char e = d+c+b+a;
        printf("%c", e);

    const float f = e+d+c+b+a;
        printf("%f", f);

    const int g = e+d+c+b+a+f;
        printf("%d", g);

    const int h = g%12;
        printf("%x", h);

    const int i = h-g*b/e;
        printf("%x", i);

    return 0;
}