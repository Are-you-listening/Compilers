#include <stdio.h>

int main ()
{
    int x = 5;
    float y = 454343534.21;
    char z = 'a';
    int d = x + y * z - z / (y / z);
    int e = 10 % d;
    int f = e << 4;
    int g = f >> 4;

    printf("%d", x);
    printf("%f", y);
    printf("%c", z);
    printf("%d", d);
    printf("%d", e);
    printf("%d", f);
    printf("%d", g);

    return 0;
}