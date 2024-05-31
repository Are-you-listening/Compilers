#include <stdio.h>
#include <stdlib.h>

#define OOPS struct a

OOPS{
    int v;
};


int main() {

    struct a* w = (OOPS*) malloc(sizeof(OOPS));
    w->v = 5;

    printf("%d", w->v);


    free((char*) w);



    return 0;
}