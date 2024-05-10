#include <stdio.h>

int main(){
    int b;
    int a = 1;
    switch(a){
        case 1:
            b = 1;
            break;
        default:
            b = 3;
            break;

    }
    printf("%d", b);
    return 0;
}