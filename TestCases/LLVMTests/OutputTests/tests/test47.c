#include <stdio.h>

int main() {
    int data[5] = {1, 2, 3, 4, 5};
    int* ptr = data;
    int i;
    for (i = 0; i < 4; ++i) {
        printf("ptr + %d < ptr + %d: %d\n", i, i+1, (ptr + i) < (ptr + i + 1));
    }
    return 0;
}
