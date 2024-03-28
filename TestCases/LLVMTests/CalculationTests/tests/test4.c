#include <stdio.h>


int main() {
    int x = 4;
    x = 1;
    int* ptr = &x;


    int is_x = (ptr == &x);

    printf("%d", is_x);
    return 0;
}
