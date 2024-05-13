#include <stdio.h>
#include <stdlib.h>

int main(){

    char* f = (char*) calloc(10, 4);

    *(f+9) = 5;
    printf("%d", *(f+9));



    return 0;

}