#include <stdio.h>

int a(int u) {
    return u + 1;
}




int (*b())(int) {
    int (*c)(int) = &a;
    return c;
}

int main() {

    int (*(*u)())(int) = &b;

    printf("%d", u()(4));
    return 0;
}