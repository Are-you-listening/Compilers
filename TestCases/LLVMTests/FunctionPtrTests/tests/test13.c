#include <stdio.h>

float mul(int** b){
    printf("%d;", **b);
    return 5.4;
}

int main() {
    float (*m)(int**) = &mul;

    int c = 6;
    int* a = &c;
    int** d = &a;
    printf("%f", m(d));

    return 0;
}