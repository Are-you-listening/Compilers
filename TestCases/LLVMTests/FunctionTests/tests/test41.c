#include <stdio.h>

void xd(int a) {
    int x = a + 10;
    printf("d%", x);
}

int lol(int a)
{

    return a + 100;
}

int main() {
    int b = 5;
    lol(xd(5));
    return 5;
}
