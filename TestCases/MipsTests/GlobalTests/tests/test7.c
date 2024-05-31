#include <stdio.h>
#include <stdlib.h>

char a[1][1][1];

int main() {

    a[0][0][0] = 'b';

    printf("%c", a[0][0][0]);






    return 0;
}