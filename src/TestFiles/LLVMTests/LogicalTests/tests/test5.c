#include <stdio.h>

int main(){
    int a = 0;
    int b = 0;
    int c = 0;
    int d = 0;
    int e = 0;
    int f = 0;

    a = 0;
    b = 0;
    c = 0;
    d = 0;
    e = 0;

    f = (a && (b || c)) || (d && c) && e;
    printf("%d", f);

    a = 1;

    f = (a && (b || c)) || (d && c) && e;
    printf("%d", f);

    b = 1;

    f = (a && (b || c)) || (d && c) && e;
    printf("%d", f);

    c = 1;

    f = (a && (b || c)) || (d && c) && e;
    printf("%d", f);

    d = 1;

    f = (a && (b || c)) || (d && c) && e;
    printf("%d", f);

    e = 1;

    f = (a && (b || c)) || (d && c) && e;
    printf("%d", f);

    return 0;

}