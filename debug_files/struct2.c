#include <stdio.h>

union NotTypeSafe {
int as_integer;
float as_float;
char as_str[50][50];
};

int main() {
    int k;
    float s;
    union NotTypeSafe safety;
    union NotTypeSafe safety_ptr = &safety;

    safety.as_integer = 5;
    k = safety.as_integer;

    safety.as_float = 3.14;

    printf("%f", (*safety_ptr).as_float);

    return 0;
}