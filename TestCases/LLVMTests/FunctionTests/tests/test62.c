#include <stdio.h>

const int *getPointer() {
    const int value = 100;
    return &value;
}

int main() {
    const int *ptr = getPointer();
    *ptr = 200;
    printf("%d\n", *ptr);
    return 0;
}
