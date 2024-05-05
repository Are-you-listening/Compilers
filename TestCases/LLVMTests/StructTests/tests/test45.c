#include <stdio.h>

union NotTypeSafe {

char as_str[30][2];
float as_float2[3][5];

};

int main() {
    union NotTypeSafe gouda;

    gouda.as_str[1][1] = 'a';
    printf("%c", gouda.as_str[1][1]);



    return 0;
}