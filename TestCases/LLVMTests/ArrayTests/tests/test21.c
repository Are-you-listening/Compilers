#include <stdio.h>

int main() {
    int z[1] = {5};

    int* s = z;
    int** t = &s;
    int* b = *t;
    printf("%d", b[0]);
    return 0;
}