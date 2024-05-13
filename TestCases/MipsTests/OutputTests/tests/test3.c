#include <stdio.h>


int main() {
    int x = 4;
    int y = 5;

    printf("%d", x);

    int* ptr = &x;
        printf("%d", *ptr);

    ptr++;
    ptr--;


    int is_x = (ptr == &x);
    int is_y = (ptr == &y);
    printf("%d", is_y);
        printf("%d", is_x);
    is_y = (&x != ptr);
        printf("%d", is_y);

    float* ptr2 = 0;

    ptr2 >= ptr;
    ptr2 <= ptr;
    ptr > &x;
    ptr < 32;

    int num_skip_elements = 4;

    ptr = ptr + 4*num_skip_elements;
    return 0;
}
