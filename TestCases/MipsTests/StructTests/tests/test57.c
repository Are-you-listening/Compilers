#include <stdio.h>

struct kaas{
int a;
};

int main(){
int b[2];
    struct kaas gouda;
    struct kaas ementaler;
    struct kaas beemster;
    beemster.a = 28;
    ementaler.a = 3;
    gouda.a = 6;

    int a[4] = {1,2,3,4};
    int* k = a;
    k = k + 2;
    printf("%d", *k);

    printf("%d", 0 > 1);

    struct kaas wegdes[3] = {beemster, ementaler, gouda};
    struct kaas* ptr = wegdes;
    ptr = ptr + 2;
    printf("%d", (*ptr).a);



    return 0;
}