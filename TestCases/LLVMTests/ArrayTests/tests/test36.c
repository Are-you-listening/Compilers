#include <stdio.h>


int main(){

    char k[4] = {'l','o','c','k'};


    char* c = &k[1];

    printf("%c", *c);

    printf("%c", *(k+2));


    return 0;
}