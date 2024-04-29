#include <stdio.h>

void name(int a) {
    int name = 0;
    printf("%d\n", name);
    return;
}

int main() {

    int b = 5;
    name(b);
    printf("%d\n", b);
    return 0;
}