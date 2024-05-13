#include <stdio.h>

int main(){

    int a = 1;
    int b = 1;

    a = 1;
    b = 1;

    if (a && b){
        printf("%d", 1);
    }

    a = 1;
    b = 0;

    if (a && b){
        printf("%d", 1);
    }

    a = 0;
    b = 1;

    if (a && b){
        printf("%d", 1);
    }

    a = 0;
    b = 0;

    if (a && b){
        printf("%d", 1);
    }

    return 0;

}