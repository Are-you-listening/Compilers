#include <stdio.h>

int func(int a, int b) {
    return a + b;
}

int func(int a, int b) {
    return a - b;
}

int main() {
    int y = 5;
    int u = 10;
    char x = 'a';
    int c;
    c = func(y, u);
    printf("%d\n", c);
    return y;
}