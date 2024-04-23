#include <stdio.h>


int main() {

const int x = 98362;

printf("%x", x);

const int* x_ptr = &x;
printf("%x", *x_ptr);

const int** p = &x_ptr;
printf("%x", **p);
const int* z = &x;
printf("%x", *z);

const float a = 856.25668;
printf("%f", a);
const float* a_ptr = &a;

printf("%f", *a_ptr);
    return 0;

}
