#include <stdio.h>

int main(){

    char* ptr = (char*) malloc(5);
    *(ptr+4) = 'a';

    printf("%c", *(ptr+4));

    return 0;

}