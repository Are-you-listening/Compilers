#include <stdio.h>
#include <stdlib.h>

char a[2][1][1];

int main() {

    a[1][0][0] = 'b';

    printf("%c", a[1][0][0]);






    return 0;
}