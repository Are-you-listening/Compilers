#include <stdio.h>

int main() {
    int a = (10 + 3) * (7 - 2);
    printf("%d", a);
    int b = (100 / 4) % 3;
    printf("%d", b);
    int c = (5 << 2) + (8 >> 1);
    printf("%d", c);
    int d = ~(~10 & 7);
    printf("%d", d);
    int e = (15 | 3) ^ (7 & 2);
    printf("%d", e);
    int f = (20 > 10) && (5 <= 7);
    printf("%d", f);
    int g = (10 == 5) || (7 != 3);
    printf("%d", g);
    int h = !(10 >= 20);
    printf("%d", h);
    float j = (5.5 * 2.0) / (3.0 + 1.0);
    float k = (7.0 + 3.0) * (2.5 - 1.5);
    return 0;
}