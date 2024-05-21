#include <stdio.h>

int factorial(int c);

int main() {
    int n = 5;
    int (*factorial_ptr)(int) = &factorial;
    int fact = factorial_ptr(n);
    printf("%d", fact);
    return 0;
}

int factorial(int n) {
    if (n == 0) {
        return 1;
        }
    else {
        return n * factorial(n - 1);
        }
}