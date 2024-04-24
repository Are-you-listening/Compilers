#include <stdio.h>

int main() {
    const int a = 5;
    const int* b = &a;

    *(b+1) = 8;

    return 0;
}