#include <stdio.h>

struct v{
    int a;
};

struct v h;

void l(){
    printf("%d", h.a);
    h.a = 5;
}


int main(){
    h.a = 4;

    printf("%d", h.a);
    l();
    printf("%d", h.a);


    return 0;
}