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



    return 0;
}