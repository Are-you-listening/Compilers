#include <stdio.h>

int main(){
    int b = 5;
    int a = 3;

    a && b && 0 && 1;
    a = a && b && 0 && 1;
    printf("%d", a);
    printf("........... %% %d ", a && b && 0 && 1);
    return 0;
}