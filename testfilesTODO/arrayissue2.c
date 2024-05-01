#include <stdio.h>

float mul(int** b){
    printf("%d", b[0]); // This isn't always possible when an int* is given instead of int**
    return 0.0;
}

int main() {
    int z[5] = {1,2,3,4,5};

    int** a = &z;
    mul(a);

    return 0;
}