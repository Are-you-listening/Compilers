#include <stdio.h>

int main() {
    int x = 10;
    {
        int x = 20;
    }
    printf("%d\n", x);
    return 0;

    int a = printf("%d", 5);
    printf("%d", a);

    printf("%d", printf("%d", 5));

}