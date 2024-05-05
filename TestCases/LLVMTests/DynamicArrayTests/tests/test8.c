#include <stdio.h>


struct v{
    int a;
    float b;
};

int main(){

    struct v* c = malloc(200);
    c->a = 5;

    printf("%d", c->a);

    free(c);


    return 0;
}