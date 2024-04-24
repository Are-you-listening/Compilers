#include <stdio.h>

int main(){
    if (2 == 3){
        printf("never executed");
    }

    if ('a' == 3){
        printf("never executed");
    }

    if (1 > 0){
        printf("never executed");
    }

    if (1 < -1){
        printf("never executed");
    }

    if (2 != 2){
        printf("never executed");
    }

    if (-1==-1){
        printf("executed");
    }
    return 0;
}