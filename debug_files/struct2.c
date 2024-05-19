#include <stdio.h>




int main() {
    int a = 1;
    a = 1;
    int b = 1;
    b = 1;

    int c = a && b;
    printf("%d", c);

    return 0;
}