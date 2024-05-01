#include <stdio.h>

int main() {
    int x = 4;
    int* ptr = &x;
    ++(*ptr);
    printf("%d", x);
    return 0;
}