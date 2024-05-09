#include <stdio.h>

#define POSITIVEINT int

#define COOLSTRUCT struct a

COOLSTRUCT{
    COOLSTRUCT* b;
    POSITIVEINT v;
};


int main() {

    COOLSTRUCT c;
    COOLSTRUCT d;
    d.v = 5;

    c.b = &d;

    printf("%d", c.b->v);

    return 0;
}