#include <stdio.h>

int main(){
    const char a = 'a';
    printf("%c\n", a);
    const int b = a;
        printf("%d\n", b);

    const float c = b;
        printf("%d\n", (int) c);

    const int d = c+b+a;
        printf("%d\n", d);

    const char e = d+c+b+a;
        printf("%c\n", e);

    const float f = e+d+c+b+a;
        printf("%d\n", (int) f);

    const int g = e+d+c+b+a+f;
        printf("%d\n", g);

    const int h = g%12;
        printf("%x\n", h);

    const int i = h-g*b/e;
        printf("%x\n", i);

    return 0;
}