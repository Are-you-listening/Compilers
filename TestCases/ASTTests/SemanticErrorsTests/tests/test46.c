#include <stdio.h>


int main(){

    char k[4] = {'l','o','c','k'};


    char* c = &k[1];

    printf("%c", *c);

    k + 3;
    printf("%c", *(k+2));

    k + 3.14;


    return 0;
}