#include <stdio.h>


int main() {
int integer = 5;

printf("%d", integer);

int* int_ptr = &integer;
printf("%d", *int_ptr);

int ** ptr_ptr = &int_ptr;
printf("%d", **ptr_ptr);

int **another_pointer = ptr_ptr;
printf("%d", **ptr_ptr);
printf("%d", **another_pointer);

int z = integer + 5;
printf("%d", z);

int_ptr = &z;
printf("%d", *int_ptr);

int* pointer = &z;
printf("%d", *pointer);

int x = *pointer;
printf("%d", x);

int** x_ptr = &int_ptr;

printf("%d", **x_ptr);

    return 0;

}
