#include <stdio.h>


int main() {
    int a = 15;
    int x = a + 50 || 0 + 1 ;
    int b = a + x && 5 - 5;
    int c = 1 && a + x;
    int d = 0 || c / 80;

        printf("%d", a);
    printf("%d", x);
    printf("%d", b);
    printf("%d", c);
    printf("%d", d);

    return 0;
   }