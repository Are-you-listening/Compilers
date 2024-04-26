#include <stdio.h>

int func(int a, int b);

int main() {
    int y = 5;
    int u = 10;
    char x = 'a';
    int c;
    c = func(y);
    printf("%d\n", c);
    return y;
}




int func(int a, int b) {
    return a + b;
}