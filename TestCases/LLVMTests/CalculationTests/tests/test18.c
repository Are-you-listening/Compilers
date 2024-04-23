#include <stdio.h>


typedef int bool;

int main() {
    bool x = 1;
    bool y = 0;

    printf("%d", x);
        printf("%d", y);

    int z = x && y;

        printf("%d", z);

    bool b = y * z * 57809;

        printf("%d", b);

        return 0;

}
