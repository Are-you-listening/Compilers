#include <stdio.h>
#include <stdlib.h>

#define OOPS union a

OOPS{
    OOPS* b;
    int v;
};


int main() {

    union a* v = (OOPS*) malloc(sizeof(OOPS));
    union a* w = (OOPS*) malloc(sizeof(OOPS));
    w->v = 5;

    v->b = w;

    printf("%d", w->v);
    printf("%d", v->b->v);


    free((char*) v);
    free((char*) w);


    return 0;
}