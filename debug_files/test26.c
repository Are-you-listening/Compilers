#include <stdio.h>

float mul(int** b){
    printf("%d", (*b)[0]);
    return 0.0;
}



int main() {
    int z[1] = {1};

    int** a = &z;
    mul(a);

    return 0;
}