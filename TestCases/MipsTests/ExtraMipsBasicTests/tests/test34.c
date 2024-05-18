#include <stdio.h>

struct a{
    int b;
};

int main() {
    struct a c;
    c.b = 4;

    printf("%d", c.b);

    return 0;
}