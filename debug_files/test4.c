#include <stdio.h>

int main(){

    int a = 1;
    int b = 1;
    int c = 1;
    int d = 1;

    a = 1;
    b = 1;
    c = 1;
    d = 1;


    if (a){
        printf("%d", 1);
        if (b < c){
            printf("%d", 2);

        }else if (b > d){
            printf("%d", 3);
        }
    }else if (b){
        printf("%d", 4);
        if (!c){
            printf("%d", 5);
        }else if (d){
        }
        printf("%d", 6);

    }else if (c){
        if (a < b){
            printf("%d", 7);
        }else{
        }
    }else if (d){
        printf("%d", 8);
        if (d){
        printf("%d", 9);
        }
    }

    printf("%d", 10);

    return 0;

}