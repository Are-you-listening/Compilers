#include <stdio.h>


int main(){
    int a = 1;
    int b = 1;
    printf("%d", a == b);
    printf("%d", a != b);
    b = 0;
    printf("%d", a == b);
    printf("%d", a != b);
    return 0;
}
