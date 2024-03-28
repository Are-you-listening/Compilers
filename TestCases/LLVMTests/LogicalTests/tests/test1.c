#include <stdio.h>

int main(){
    int a = 0;
    int b = 1;
    int c = 6;
    a = 0;
    b = 1;
    c = 6;
    int d = (a && b || c);
    printf("%d", d);
    return 0;

}