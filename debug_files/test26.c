#include <stdio.h>
#include <stdlib.h>

#define OOPS union a

OOPS{
    OOPS* b;
    int v;
};


int main() {

    union a* w = (OOPS*) malloc(sizeof(OOPS));
    w->v = 5;

    printf("%d", w->v);






    return 0;
}