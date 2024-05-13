#include <stdio.h>

union NotTypeSafe {
int as_integer;
char as_str[1];
float as_float;
};

int main() {
    union NotTypeSafe gouda;

    gouda.as_integer = 5;

    int a = 5;
    int b = 6;

    a = 5;
    b = 8792432;

    printf("%d", gouda.as_integer);

    gouda.as_str[0] = 'a';


    printf("%c", gouda.as_str[0]);


    return 0;
}