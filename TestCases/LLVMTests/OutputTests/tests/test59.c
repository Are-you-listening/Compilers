#include <stdio.h>

int main() {
    int a = 50;

    {
        int b = a + 10;
        {
            int b = a + 20;
            printf("%d\n", b);
        }
        printf("%d\n", b);
    }

    printf("%d\n", a);
    return 0;
}
