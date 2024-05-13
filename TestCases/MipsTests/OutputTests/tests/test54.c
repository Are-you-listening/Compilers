#include <stdio.h>


int main(){

    char k[2] = {'l','o'};


    char* c = &k[1];

    printf("%c", *c);



    return 0;
}