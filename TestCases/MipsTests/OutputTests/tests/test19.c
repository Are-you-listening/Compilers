#include <stdio.h>


int main() {
const float f = 0.789;
const float* f_ptr = &f;

printf("%d", (int) *f_ptr);
printf("%d", (int) f);

float* non_const_f_ptr = f_ptr;

printf("%d", (int) *non_const_f_ptr);

*non_const_f_ptr = 3.1492;

printf("%d", (int) *non_const_f_ptr);
printf("%d", (int) f);

    return 0;

}
