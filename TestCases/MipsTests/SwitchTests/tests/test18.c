#include <stdio.h>

int main(){
    int a = 9;
    int b;
    switch(a){
        case 1:
            b = 1;
            printf("%d", 1);
            break;
        case 6:
            printf("%d", 6);
            break;
        default:
            b = 3;
            printf("%d", 3);
        case 7:
        {
        int b = 7;
        printf("%d", b);
        }
    }

    printf("%d", 4);

    return 0;
}