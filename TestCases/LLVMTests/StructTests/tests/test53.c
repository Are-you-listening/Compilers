#include <stdio.h>

struct v{
    int a;
};

struct v* hello(){
    struct v* n= malloc(sizeof(struct v));
    n->a = 5;

    return n;
}

int main(){

    struct v* b = hello();
    printf("%d", b->a);

    return 0;

}