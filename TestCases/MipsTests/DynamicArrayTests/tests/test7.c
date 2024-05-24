#include <stdio.h>
#include <stdlib.h>

int main(){

    int* f = (int*) calloc(10, 4);

    *(f+9) = 5;
    printf("%d", *(f+9));

    free(f);

    f = (int*) calloc(10, 4);

    *(f+9) = 5;
    printf("%d", *(f+9));

    f = (int*) realloc(f, 40);


    printf("%d", *(f+9));

    free(f);

    return 0;

}