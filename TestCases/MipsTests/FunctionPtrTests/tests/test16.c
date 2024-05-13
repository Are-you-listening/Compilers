#include <stdio.h>


int a(int b){
    return b;
}

int main(){

    int (*c)(int) = a;

    int d = c(5);

    printf("%d", d);


    return 0;
}