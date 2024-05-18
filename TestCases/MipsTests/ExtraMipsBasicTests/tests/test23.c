#include <stdio.h>

int a (){
    return 1;
}

int main(){
    int b = a() + a();
    printf("%d", b);
    int c = 5;

    c = 4+b;

    printf("%d", c);
    return 0;
}
