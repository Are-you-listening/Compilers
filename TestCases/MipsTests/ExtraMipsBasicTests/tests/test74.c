#include <stdio.h>
#include<stdlib.h>
int main(){
    char* a = malloc(8);
    *a = '5';

    printf("%c", *a);

    return 0;
}