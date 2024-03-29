#include <stdio.h>

int main() {
    int c = -251454;

    int* b_ptr = &c;

    int** x_ptr = &b_ptr;
    x_ptr = &b;
    printf("%d", **x_ptr);

    return 0;
}
