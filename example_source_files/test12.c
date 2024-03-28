#include <stdio.h>

int main() {
    int y = 4;
    int b = 9632;

    const int* x_ptr = &b;
    printf("%d", *x_ptr);

    *x_ptr = y;

    return 0;


}