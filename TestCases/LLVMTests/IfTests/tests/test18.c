#include <stdio.h>

int main(){

    int a = 1;
    int b = 1;

    a = 1;
    b = 0;

    if (b){
        printf("%d", 1);
        int x = 0;
        printf("%d", x);
    } else {
    printf("%d", 2);
        int x = 1;
        printf("%d", x);
    }


    if (0){
        printf("%d", 3);
        int y = 0;
        printf("%d", y);
    } else if (!b){
        printf("%d", 4);
        int y = 1;
        printf("%d", y);
    }


    return 0;

}