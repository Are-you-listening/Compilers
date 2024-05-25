#include <stdio.h>
#include <stdlib.h>



int main() {

    int a[3] = {1, 2, 3};

    int* p = &a;
    int* q = (p+1);


    int v = q - p;

    printf("%d", v);


    return 0;
}