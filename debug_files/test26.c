#include <stdio.h>
#include <stdlib.h>



struct v{
    int* u;
};

int* l(struct v i){
    printf("\n%x\n", i.u);
    *i.u = 6;
    return i.u;
}

int main() {


    struct v k;
    int a = 5;
    k.u = &a;

    printf("\n%x\n", k.u);
    printf("%d", *k.u);
    printf("%d", *l(k));
    printf("\n%x\n", k.u);
    printf("%d", *k.u);




    return 0;
}