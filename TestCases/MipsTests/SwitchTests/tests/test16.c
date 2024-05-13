#include <stdio.h>

int main(){

    int a = 0;
    int b = 0;
    a = 1;
    switch(a){
        case 1:
            b = 1;
            printf("%d", 1);
        case 6:
            printf("%d", 6);
        default:
            b = 3;
            printf("%d", 3);

    }

    printf("%d", 4);

    return 0;
}