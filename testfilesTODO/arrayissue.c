#include <stdio.h>

float mul(int** b){
    printf("%d", (*b)[0]);
    return 0.0;
}

int main() {
    int z[5] = {1,2,3,4,5};

    int* a = z;
    int** b = &a;
    mul(b);

    int** s = &z; // TODO crash in to llvm

    return 0;
}