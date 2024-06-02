#include <stdio.h>
#include <stdlib.h>



int main() {

    int a[100];
    int i = 0;

    char* v = a;
    a[0] = 6;

    printf("%d %d\n", a[0], *v);
    *v = 7;
    printf("%d %d\n", a[0], *v);

    for (i = 0; i< 100; i++){
        int j = 5;
        for (j = 0; j< 20; j = j+2){
            int  k = j+i;
            k = k% 100;

            a[k] = i+j;



            printf("%d %d %d\n ", a[k], i+j, k);
            printf("%d %d %d\n", *(a+k), (a+k)-a, *(a+k)-*a);
            printf("%d", (a+k) > a);
        }
    }
    v++;
    v--;
    printf("%d %d\n", a[0], *v);

    return 0;
}