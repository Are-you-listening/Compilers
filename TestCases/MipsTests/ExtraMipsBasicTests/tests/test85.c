#include <stdio.h>
#include <stdlib.h>



int main() {

    int a[3] = {1, 2, 3};

    int* p = &a;
    int* q = (p+1);


    int v = q - p;
    printf("%d", (q-1) == p);
    printf("%d", v);
    printf("%d", p < q);

    p = 0;
    printf("%d", p);

    printf("%d", p == 0);
    p++;
    printf("%d", p >= 0);





    return 0;
}