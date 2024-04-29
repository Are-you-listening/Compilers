#include <stdio.h>

int a(int u) {
    return u + 1;
}




int (*b())(int) {
    int (*c)(int) = &a;
    return c;
}

int (*(*c(int (*(*w)())(int)))())(int){
    int (*(*q)())(int) = w;
    return q;
}

int main() {

    int (*(*u)())(int) = &b;

    printf("%d", u()(4));

    u = c(u);

    printf("%d", u()(4));

    return 0;
}