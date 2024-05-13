#include <stdio.h>
#include <stdlib.h>
int main(){

    int* ptr = (int*) malloc(5);
    *(ptr+3) = 1;

    printf("%c", *(ptr+3));

    return 0;

}