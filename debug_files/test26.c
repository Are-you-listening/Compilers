#include <stdio.h>
#include <stdlib.h>

char a[2][2][2];

int main() {
    a[0][0][0] = 'a';
    a[1][0][0] = 'c';
    a[1][1][1] = 'b';

    int* v = a;

    printf("%c", *(v));
    //printf("%c", *(v+1));






    return 0;
}