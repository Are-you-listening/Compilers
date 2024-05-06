#include <stdio.h>

int main(){
    int i = 1000;
    int* a = &i;

    printf("%d", a < 0);
    printf("%d", a > 0);

    printf("%d", a > (a+1));

    return 0;

}