#include <stdio.h>


int main() {
const float f = 0.789;
const float* f_ptr = &f;

printf("%f", *f_ptr);
printf("%f", f);

float* non_const_f_ptr = f_ptr;

printf("%f", *non_const_f_ptr);

*non_const_f_ptr = 3.1492;

printf("%f", *non_const_f_ptr);
printf("%f", f);

    return 0;

}
