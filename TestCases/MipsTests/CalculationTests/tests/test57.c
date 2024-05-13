#include <stdio.h>

int g(int c){

    int d = c+5;


    return c;
}


int main(){
    int a = 5;

    int v = g(a);

    printf("%d", v);


    return 0;
}