#include <stdio.h>


int main() {
    int x = 4;
    int y = 5;
    int a = 9;
    int* ptr = &x;
    ptr++;
    ptr--;

    int is_x = (ptr == &x);
    printf("%d", is_x);
    int is_y = (ptr == &y);
    printf("%d", is_y);
    is_y = (&x != ptr);
    printf("%d", is_y);
    float* ptr2 = 0;
    printf("%d", ptr2);
    return 0;
}
