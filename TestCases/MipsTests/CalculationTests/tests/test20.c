#include <stdio.h>

int main(){
    char a = 0;
    char b = 1;
    printf("%d", a && b);
    printf("%d", a || b);
    printf("%d", !(a || b));

    char c = 0;
    char d = 0;
    printf("%d", c && d);
    printf("%d", c || d);


    return 0;
}

