#include <stdio.h>

int main(){

    int a = 1;
    a = 3;

    if (a){
        printf("%d", 1);
    }else{
        printf("%d", 2);
    }

    a = 0;

    if (a){
        printf("%d", 1);
    }else{
        printf("%d", 2);
    }

    return 0;

}