#include <stdio.h>
#include <stdlib.h>



int main() {
    char a[2][2][2];

    a[0][0][0] = 'a';
    a[0][0][1] = 'c';
    a[1][1][1] = 'b';

    char* v = a;

    printf("%c", *(v));
    printf("%c", *(v+1));






    return 0;
}