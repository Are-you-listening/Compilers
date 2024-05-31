#include <stdio.h>
#include <stdlib.h>

char a[2][2];

int main() {

    a[0][0] = 'a';
    a[0][1] = 'b';

    char* v = a;

    printf("%c", *(v));
    printf("%c", *(v+1));






    return 0;
}