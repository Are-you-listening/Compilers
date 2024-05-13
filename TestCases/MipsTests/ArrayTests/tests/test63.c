#include <stdio.h>

int main(){
    int c[5] = {1, 2,3,4,5};
    c[1] = 0;
    printf("%d", c[0]);
    printf("%d", c[1]);
    printf("%d", c[2]);
    printf("%d", c[3]);
    printf("%d", c[4]);

    return 0;
}
