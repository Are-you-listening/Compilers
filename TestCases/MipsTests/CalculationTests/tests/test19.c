#include <stdio.h>

int main(){
    const float f = 0.789;
    const float* f_ptr = &f;
    float* non_const_f_ptr = f_ptr;
    *non_const_f_ptr = 3.1492;
    printf("%f", *non_const_f_ptr);
    printf("%f", f);
    return 0;
}