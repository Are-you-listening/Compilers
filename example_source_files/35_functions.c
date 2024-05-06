#include <stdio.h>

int factorial(int c);

int main() {
    int n = 5;
    int fact = factorial(n);
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