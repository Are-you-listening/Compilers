#include <stdio.h>

int main(){
    int a = 5;
    int b = 9;
    int c = 6;
    a = 5;
    b = 9;
    c = 6;
    int d = (a && b || c);
    printf("%d", d);
    return 0;

}