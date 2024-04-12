#include <stdio.h>

int main(){

    int a = 0;
    int b = 0;
    a = 200;
    switch(a){
        default:
            b = 3;
            printf("%d", 3);

        case 1:
            b = 1;
            printf("%d", 1);

            if (a < 3){
                printf("%d", 7);
            }
        case 6:
            b = 6;
            printf("%d", 6);


        case 2:
            b = 2;
            printf("%d", 2);


    }

    printf("%d", 4);

    return 0;
}