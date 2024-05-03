#include <stdio.h>

int main() {
    const int incr = 5;
    int* ptr = &incr;
    int sum = 0;
    int i;
    for (i = 0; i < 10; i++) {
        sum = sum + incr;
    }

    printf("%d", sum);
    return 0;
}
