#include <stdio.h>

int main(){
    float a = 5.0;
    printf("%d\n", (int) a);
    int b = 5;
    printf("%d\n", b);
    char c = 'e';
    printf("%c\n", c);
    const float d = 10.01;
    printf("%d\n", (int) d);
    const int e = 2;
    printf("%d\n", e);
    const char f = 'b';
    printf("%c\n", c);
    return 0;
}