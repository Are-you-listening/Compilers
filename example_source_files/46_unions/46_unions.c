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
    union NotTypeSafe* safety_ptr;

    safety.as_integer = 5;
    k = safety.as_integer;

    safety_ptr->as_float = 3.14;

    int q = safety_ptr->as_integer;

    (*safety_ptr).as_str[49][49] = 'a';

    return 0;
}