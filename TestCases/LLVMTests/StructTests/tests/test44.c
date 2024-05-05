#include <stdio.h>

union NotTypeSafe {
int as_integer;
char as_str[30][2];
float as_float2[3][5];
float as_float;
};

int main() {
    union NotTypeSafe gouda;

    gouda.as_integer = 5;


    int q = gouda.as_integer;

    printf("%d", q);

    gouda.as_str[1][1] = 'a';
    printf("%c", gouda.as_str[1][1]);

    gouda.as_float2[1][1] = 5.2;
    printf("%f", gouda.as_float2[1][1]);


    return 0;
}