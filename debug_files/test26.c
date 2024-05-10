#include <stdio.h>

int main(){
    int x = 0;
    printf("%d", x);
    {
        printf("%d", x);
        int x = 1;
        printf("%d", x);
        if (x){
            printf("%d", x);
            int x = 2;
            printf("%d", x);
        }
        printf("%d", x);
    }


    return 0;
}