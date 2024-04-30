#include <stdio.h>

void name(int a) {
    int name = 0;
    printf("d%", 1);
    return 0;
}

void xd(int a) {
    printf("d%", 2);
    return a + 10;
}

void testingThis();

int main() {
    int b = 5;
    name(b);
    testingThis();
    return 0;
}


void testingThis() {
    return 10 + 10 + 3;
    printf("d%", 3);
}