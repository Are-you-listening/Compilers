#include <stdio.h>

int main(){
    int b[2] = {1,2};
    int a[4] = {1,2,3,4};

    int e;
    int* sb = b;
    int* sa = a;

    e = a || b; ;;;;
    printf("%d", e);

    e = sb || sa;
    printf("%d", e);

    e = !a;
    printf("%d", e);

    e = !sb;
    printf("%d", e);

    return 0;
}