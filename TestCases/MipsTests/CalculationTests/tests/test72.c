#include <stdio.h>
#include <stdlib.h>



int main() {


    /*
    * hello world
    */

    char c = 'a';
    char d = 'b';

    printf("%d", c < d);
    printf("%d", c + d);
    printf("%d", c - d);
    printf("%d", c * d);
    printf("%d", c / d);
    printf("%d", c >= d);

    printf("%d", c == d);
    printf("%d", c != d);

    printf("%d", c ^ d);

    return 0;
}