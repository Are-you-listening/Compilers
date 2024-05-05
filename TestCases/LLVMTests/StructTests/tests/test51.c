#include <stdio.h>

struct a{
    int b;
};

struct c{
    struct a w;
};


int main(){

    struct c h;
    h.w.b = 5;

    printf("%d", h.w.b);


    return 0;
}