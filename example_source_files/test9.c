#include <stdio.h>

int main(){
    const float f = 0.789;
    const float* f_ptr = &f;
    float* non_const_f_ptr = f_ptr;
    *non_const_f_ptr = 3.1492;
    // f is now equal to 3.1492
    printf("%f", f);
    printf("%f", *non_const_f_ptr);

    return 0;
}

