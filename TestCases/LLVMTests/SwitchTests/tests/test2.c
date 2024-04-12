#include <stdio.h>

int main(){

    int a = 0;
    int b = 0;
    a = 2;
    switch(a){
        case 1:
            b = 1;
            printf("%d", 1);
        case 6:
            b = 6;
            printf("%d", 6);
        case 2:
            b = 2;
            printf("%d", 2);
            break;
        default:
            b = 3;
            printf("%d", 3);
            break;

    }

    printf("%d", 4);

    return 0;
}