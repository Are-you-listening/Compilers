
#include <stdio.h>
#include <stdlib.h>

union v{
    int a;
    float b;
    int c;
};

int main(){

    union v* c = malloc(sizeof(union v));
    c->a = 5;

    printf("%d", c->a);

    free(c);


    return 0;
}