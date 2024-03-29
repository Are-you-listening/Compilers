#include <stdio.h>

int main ()
{
    int x = 50;
    int y = -22;
    int z = 6;

    int a = (x && (y || z)) && !x;

    int b = 6;
    int c = 4;
    int d = 3;
    int e = d & c | d;

    printf("%d", e);
    printf("%d", e^d);
    printf("%d", ~e);

    printf("%d", x);
    printf("%d", y);
    printf("%d", z);
    printf("%d", a);
    printf("%d", b);
    printf("%d", c);
    printf("%d", d);
    printf("%d", e);

    return 0;
}