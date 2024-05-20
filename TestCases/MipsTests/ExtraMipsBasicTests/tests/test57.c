#include <stdio.h>

int main() {
    int x[2][3];

    x[0][0] = 0;
    x[0][1] = 1;
    x[0][2] = 2;
    x[1][0] = 3;
    x[1][1] = 4;
    x[1][2] = 5;
    printf("%d", x[0][0]);
    printf("%d", x[0][1]);
    printf("%d", x[0][2]);
    printf("%d", x[1][0]);
    printf("%d", x[1][1]);
    printf("%d", x[1][2]);

    x[0][2] = x[1][2] + x[1][0];

    printf("%d", x[0][2]);
    printf("%d", x[1][2]);
    printf("%d", x[1][0]);
    return 0;
}
