#include <stdio.h>

int main(){
int b[2];
    int a[4] = {1,2,3,4};
    int* k = a;
    k = k + 2;
    printf("%d ", *k);
    int e = 5 == a;
    int t = a != 5;


    printf("%d %d %d", e,t, (8==k));

    return 0;
}