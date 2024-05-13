#include <stdio.h>

int a(int u) {
    return u + 1;
}

int main() {

    int (*u)(int) = &a;

    printf("%d", (*u)(1));
    printf("%d", u(1));
    printf("%d", a(1));
    return 0;
}