#include <stdio.h>


int main() {
    int x = 5;
    int a = 0;
    a = 1;


    a = x--;
    printf("%d", a);

    int z = x--;
    printf("%d", z);

    x = x-- + z--;

    printf("%d", x);

    a = --x;

    printf("%d", a);
    printf("%d", x);



    return 0;

}
