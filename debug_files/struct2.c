#include <stdio.h>

int main() {
    int x = 10;
    {;;;;;;;;
        printf("%d\n", x);
        int x = 20;
        printf("%d\n", x);
    }
    printf("%d\n", x);
    return 0;
}