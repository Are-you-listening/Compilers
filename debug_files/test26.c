#include <stdio.h>

union a{
    int b[3];
    int d;

};

int main() {
    union a c;
    c.d = 5;

    printf("%d", c.d);

    c.b[2] = 5;

    printf("%d", c.b[2]);

    return 0;
}