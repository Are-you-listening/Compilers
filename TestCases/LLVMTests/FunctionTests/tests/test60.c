#include <stdio.h>

void modifyConst(const int x) {
    x = 5;
    printf("%d\n", x);
}

int main() {
    int a = 10;
    modifyConst(a);
    return 0;
}
