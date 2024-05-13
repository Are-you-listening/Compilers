#include <stdio.h>

int x = 100;

int innerFunction() {
    int y = x/4;
    int x = 25;
    printf("%d\n", y);
    printf("%d\n", x);
    return 0;
}

char outerFunction() {
    int y = x/2;
    int x = 50;
    printf("%d\n", y);
    printf("%d\n", x);
    innerFunction();
    return 0;
}

int main() {
    printf("%d\n", x);
    outerFunction();
    printf("%d\n", x);
    return 0;
}
