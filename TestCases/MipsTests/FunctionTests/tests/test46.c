#include <stdio.h>

void xd(int a) {
    int x = a + 10;
    printf("d%", x);
}

int main() {
    int b = 5;
    return xd(4);
}
