#include <stdio.h>

int main() {
    int array[3] = {0,1,2};
    int* array_ptr = &array[0];
    int a = *(array_ptr + 2);
    printf("%d", a);
    a = *(array_ptr++);
    printf("%d", a);
    a = *(array_ptr - 1);
    printf("%d", a);
    return 0;
}