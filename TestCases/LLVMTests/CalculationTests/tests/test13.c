#include <stdio.h>

int main() {
    int x = 5;
    printf("%d", x);
    int z = x + 3;
    printf("%d", z);

    x = z * z * z * (x + x);
    printf("%d", x);
    float f = 0.986312;
    float f2 = f * 33.0 + 2.0;
    printf("%d", (int) f2);
    f2 = f2 + f;
    printf("%d", (int) f2);
    char c = 'a';
    c = 'b';
    printf("%c", c);

    return 0;

}
