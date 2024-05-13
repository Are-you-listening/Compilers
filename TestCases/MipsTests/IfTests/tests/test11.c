#include <stdio.h>

int main(){

    int a = 6+9;

    if (a < 1000){
        printf("%d", a);
        a = 6;
    }else{
        printf("%d", a);
        a = 8;
    }

    printf("%d", a);

    return 0;

}