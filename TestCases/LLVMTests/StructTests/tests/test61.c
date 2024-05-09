#include <stdio.h>

struct a{
    struct a* b;
    int v;
};


int main() {

    struct a c;
    struct a d;
    d.v = 5;

    c.b = &d;

    printf("%d", c.b->v);

    return 0;
}