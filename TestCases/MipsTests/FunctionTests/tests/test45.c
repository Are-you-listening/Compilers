#include <stdio.h>

void xd(int a) {
    int x = a + 10;
    printf("d%", x);
}

int main() {
    int b = 5;
    int v = xd(4) + xd(10);
    return 5;
}
