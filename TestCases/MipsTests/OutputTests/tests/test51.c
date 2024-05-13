#include <stdio.h>

int main() {
    int num = 10;
    int *ptr = &num;
    const int *constPtr = (const int *)ptr;
    printf("%d\n", *constPtr);
    return 0;
}
