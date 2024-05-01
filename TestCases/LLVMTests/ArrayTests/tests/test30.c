#include <stdio.h>

int** mul(int** b){
    printf("%d", (*b)[0]);
    return b;
}

int main() {
    int z[5] = {1,2,3,4,5};

    int* a = z;
    int** b = &a;
    b = mul(b);


    printf("%d", (*b)[0]);

    return 0;
}