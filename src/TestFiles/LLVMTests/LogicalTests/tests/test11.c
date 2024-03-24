#include <stdio.h>

int main(){
    int a = 1;
    int b = 1;
    a = 1;
    b = 1;

    int f;
    f = (a || !b);
    printf("%d", f);

    return 0;

}