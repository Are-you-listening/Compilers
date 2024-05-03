#include <stdio.h>

int main(){
int b[2];
    int a[4] = {1,2,3,4};
    int* k = a;
    k = k + 2;
    printf("%d ", *k);
    int e = 5 > a;
    int t = a > 5;
    //0 > 1;
    printf("%d %d ", e,t); //46

    //a || b; Allowed
    //!a; // allowed
    //~a; Not allowed
    //-a; Not allowed
    //a%b; Not allowed
    //a^a; Not allowed
    // allowed a&&a;
    // bitwise not allowed
    //shifts not allowed

    //int* s = 0;
    //int* k = 0;
    //s > 0;
    //a >> b; Not allowed

    return 0;
}