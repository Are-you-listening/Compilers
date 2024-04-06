#include <stdio.h>

int main(){

    int a = 1;
    int b = 1;

    a = 1;
    b = 1;

    if (a && b){
        printf("%d", 1);
    }else if (a || b){
        printf("%d", 2);
    }else{
        printf("%d", 3);
    }

    return 0;

}