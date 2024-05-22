#include <stdio.h>


int main() {

int x = 98362;

int* x_ptr = &x;
printf("%d", *x_ptr);

int** p = &x_ptr;
printf("%d", **p);
int* z = &x;
printf("%d", *z);

float a = 856.25668;
float* a_ptr = &a;
printf("%d", (int) *a_ptr);

    return 0;

}
