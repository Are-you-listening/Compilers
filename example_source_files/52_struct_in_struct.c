#include <stdio.h>

struct bottle{
    struct water perier;
    struct water spa;
    struct water sea:
}

struct water{
    int has_nemo;
}

int main(){
    struct water perier;
    perier.has_nemo = 0;
    struct water spa;
    spa.has_nemo = 0;
    struct water sea:
    sea.has_nemo = 1;

    struct bottle;
    bottle.perier = perier;
    bottle.spa = spa;
    bottle.sea = sea;

    return 0;
}