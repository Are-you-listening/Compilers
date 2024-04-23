#include <stdio.h>


int main() {
    int x = 4;
    int y = 5;

    printf("%d", x);

    int* ptr = &x;
        printf("%d", *ptr);

    ptr++;
            printf("%d", *ptr); // Not pointing to x/Y ?
    ptr--;
            printf("%d", *ptr);


    int is_x = (ptr == &x);
    int is_y = (ptr == &y);
    is_y = (&x != ptr);

    float* ptr2 = 0;

    ptr2 >= ptr;
    ptr2 <= ptr;
    ptr > &x;
    ptr < 32;

    int num_skip_elements = 4;

    ptr = ptr + 4*num_skip_elements;
    return 0;
}
