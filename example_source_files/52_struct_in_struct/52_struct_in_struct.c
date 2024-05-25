#include <stdio.h>

struct water{
    int has_nemo;
};

struct bottle{
    struct water perier;
    struct water spa;
    struct water sea;
};

int main(){
    struct water perier;
    perier.has_nemo = 0;
    struct water spa;
    spa.has_nemo = 0;
    struct water sea;
    sea.has_nemo = 1;

        printf("%d", perier.has_nemo );
    printf("%d", spa.has_nemo );
    printf("%d", sea.has_nemo );

    struct bottle boo;
    boo.perier = perier;
    boo.spa = spa;
    boo.sea = sea;



    return 0;
}