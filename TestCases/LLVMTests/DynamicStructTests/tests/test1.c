#include <stdio.h>


struct v{
    int a;
    float b;
    int c;
};

int main(){

    struct v* c = malloc(sizeof(struct v));
    c->a = 5;

    printf("%d", c->a);

    free(c);


    return 0;
}