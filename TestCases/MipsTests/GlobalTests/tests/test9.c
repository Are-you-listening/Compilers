#include <stdio.h>
#include <stdlib.h>

char a[2][2][2];

int main() {

    a[1][1][1] = 'b';

    printf("%c", a[1][1][1]);






    return 0;
}