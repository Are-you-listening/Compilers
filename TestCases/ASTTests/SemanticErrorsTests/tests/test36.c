#include <stdio.h>

int main() {
    const int a = 5;
    const int* const b = &a;
    const int** const c = &b;

    c = 0;
    return 0;
}