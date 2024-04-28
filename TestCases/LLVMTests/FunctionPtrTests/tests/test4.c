#include <stdio.h>

int a(int u) {
    return u + 1;
}


int (*b())(int) {
    int (*c)(int) = &a;
    return c;
}

int main() {
    int (*c)(int) = b();
    printf("%d", (*c)(4));
    return 0;
}