#include <stdio.h>

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int main() {
    int x = 10;
    int y = 20;
    printf("%d\n", x);
    printf("%d\n", y);
    swap(&x, &y);
    printf("%d\n", x);
    printf("%d\n", y);
    return 0;
}