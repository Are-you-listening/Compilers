#include <stdio.h>

struct kaas{
float a;
};

int main(){
int b[2];
    struct kaas gouda;
    struct kaas ementaler;
    struct kaas beemster;
    beemster.a = 0;
    ementaler.a = 3.14;
    gouda.a = 6.28;

    int a[4] = {1,2,3,4};
    int* k = a;
    k = k + 2;
    printf("%d", *k);

    printf("%d", 0 > 1);





    return 0;
}