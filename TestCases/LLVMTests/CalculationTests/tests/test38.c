#include <stdio.h>

int main () {
    float a = 15.1;

    int b = '0' - 'd' - 'd';
    printf("%d", b);
    float c = 15.1 * 'a';
    char d = 50.1 + 5;
    printf("%c", d);
    char e = 'e'/'a';
    printf("%c", e);
    char f1 = 45435 + 77 + 'x' + 0 * 8;
    printf("%d", ((int) f1));
    int f = 15 % 4;
    printf("%d", f);
    int g = 2 << 3;
    printf("%d", g);
    int h = 16 >> 2;
    printf("%d", h);
    int i = 5 & 3;
    printf("%d", i);
    int j = 5 | 3;
    printf("%d", j);
    int k = ~5;
    printf("%d", k);
    int l = 5 ^ 3;
    printf("%d", l);
    int m = 7 && 0;
    printf("%d", m);
    int n = 5 || 0;
    printf("%d", n);
    int o = !1;
    printf("%d", o);
    float p = 10.5 + 3.75;
    float q = 15.6 * 2.0;
    float r = 20.0 / 4.0;
    float x = 555.0 + 445;
    return 0;
}