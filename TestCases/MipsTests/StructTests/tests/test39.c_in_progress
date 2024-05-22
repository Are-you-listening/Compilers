#include <stdio.h>

union NotTypeSafe {
int as_integer;
char as_str[30];
float as_float;
};

int main() {
    union NotTypeSafe gouda;

    gouda.as_integer = 5;
    gouda.as_str[0] = 'a';

    printf("gouda.as_integer: %c", gouda.as_integer);


    return 0;
}