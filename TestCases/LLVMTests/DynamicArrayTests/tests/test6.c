#include <stdio.h>


int main(){

    int* f = (int*) calloc(10, 4);

    *(f+9) = 5;
    printf("%d", *(f+9));
    free(f);

    return 0;

}