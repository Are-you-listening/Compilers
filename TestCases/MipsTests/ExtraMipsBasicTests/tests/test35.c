#include <stdio.h>

struct a{
    int b[2];
    int d;

};

int main() {
    struct a c;
    c.d = 4;

    printf("%d", c.d);

    return 0;
}