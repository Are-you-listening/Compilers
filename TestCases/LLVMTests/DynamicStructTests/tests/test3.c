#include <stdio.h>

struct cheese{
    int milk;
};

int main(){
    struct cheese gouda;
    gouda.milk = 3;

    struct cheese* gouda_ptr = (struct cheese*) malloc(sizeof(struct cheese));

    gouda_ptr = (struct cheese*) realloc(gouda_ptr, sizeof(struct cheese)*2);

    free(gouda_ptr);


    return 0;
}