#include <stdio.h>

union NotTypeSafe {
int as_integer;
char as_str[50][50];
float as_float2[1][1];
float as_float;
};

int main() {
    union NotTypeSafe gouda;

    gouda.as_integer = 5;

    int y = 7;

    int q = gouda.as_integer;

    printf("%d", q);

    gouda.as_float2[0][0] = 5.2;
    printf("%d", (int) (gouda.as_float2[0][0]*1000));

    gouda.as_str[49][49] = 'a';

    int w = 5;
    int z = 6;
    q = 5;
    w = 6;
    y = 4;


    printf("%c", gouda.as_str[49][49]);


    return 0;
}