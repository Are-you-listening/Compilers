#include <stdio.h>

int main() {
    int b = (char) 5;
    float a = b;
    int c = 5.5;
    const char d = (const char) c;
    char e = b+3.5;
    char f = (int) e + 'a';

    printf("%d", b);
    printf("%f", a);
    printf("%d", c);
    printf("%c", d);
    printf("%c", e);
    printf("%c", f);

    return 0;
}