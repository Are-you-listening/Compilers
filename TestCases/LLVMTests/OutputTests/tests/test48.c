#include <stdio.h>

void comparePointers(int* pa, int* pb) {
    printf("%d\n", pa < pb);
    printf("%d\n", pa > pb);
    printf("%d\n", pa == pb);
    printf("%d\n", pa != pb);
}

int main() {
    int array[2];
    comparePointers(&array[0], &array[1]);
    return 0;
}
