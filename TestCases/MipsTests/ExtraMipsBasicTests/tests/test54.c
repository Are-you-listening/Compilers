#include <stdio.h>

struct a{
    int b;
    int d;

};

int main() {
    struct a c;

    c.b = 5;
    c.d = 4;

    printf("%d", c.b);
    printf("%d", c.d);

    return 0;
}