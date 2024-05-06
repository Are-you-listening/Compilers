#include <stdio.h>

int main() {
    const int n = 5;
    int* n_ptr = &n;
    *n_ptr = 7;
    return 0;
}
