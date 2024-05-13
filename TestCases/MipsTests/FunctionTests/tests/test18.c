#include <stdio.h>

int square(int x) {
    return x * x;
}

int sumOfSquares(int a, int b) {
    return square(a) + square(b);
}

int main() {
    printf("%d\n", sumOfSquares(3, 4));
    return 0;
}