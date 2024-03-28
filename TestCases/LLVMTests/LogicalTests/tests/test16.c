#include <stdio.h>

int main(){
    int a = 0;
    int b = 0;
    int c = 0;
    int d = 0;
    int e = 0;
    int f = 0;
    int g = 0;
    int h = 0;

    a = 0;
    b = 0;
    c = 0;
    d = 0;
    e = 0;

    f = !(a || e && (d && 5 < 6));
    printf("%d", f);
    g = (a < d && e >= b);
    printf("%d", g);
    h = (a-b < d && (!(e> g)));
    printf("%d", h);

    a = 0;
    b = 1;
    c = 0;
    d = 1;
    e = 0;

    f = !(a || e && (d && 5 < 6));
    printf("%d", f);
    g = (a < d && e >= b);
    printf("%d", g);
    h = (a-b < d && (!(e> g)));
    printf("%d", h);


    a = 1;
    b = 1;
    c = 1;
    d = 1;
    e = 0;

    f = !(a || e && (d && 5 < 6));
    printf("%d", f);
    g = (a < d && e >= b);
    printf("%d", g);
    h = (a-b < d && (!(e> g)));
    printf("%d", h);

    a = 1;
    b = 0;
    c = 0;
    d = 1;
    e = 0;

    f = !(a || e && (d && 5 < 6));
    printf("%d", f);
    g = (a < d && e >= b);
    printf("%d", g);
    h = (a-b < d && (!(e> g)));
    printf("%d", h);


    return 0;

}