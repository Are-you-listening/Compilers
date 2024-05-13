#include <stdio.h>

int factorial(int n) {
    if (n == 0)
    {
        return 1;
        }
    return n * factorial(n - 1);
}

int fibonacci(int n) {
    if (n <= 1)
    {
        return n;
        }
    int prev = 0;
    int curr = 1;
    for (int i = 2; i <= n; ++i) {
        int next = prev + curr;
        prev = curr;
        curr = next;
    }
    return curr;
}

int main() {
    printf("%d\n", factorial(5));

    printf("%d\n", fibonacci(7));

    return 0;
}
