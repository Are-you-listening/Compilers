#include <stdio.h>


int main() {
    int x = 98362;
    printf("%d", x);

    int* x_ptr = &x;

    int** p = &x_ptr;
    printf("%d", *p == x_ptr);
    int* z = &x;
    printf("%d", *z == x);

    float a = 856.25668;
    float* a_ptr = &a;

    printf("%f", *a_ptr == a);

    return 0;

}
