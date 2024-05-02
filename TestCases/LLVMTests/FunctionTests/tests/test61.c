#include <stdio.h>

const int getValue() {
    return 42;
}

int main() {
    int result = getValue();
    printf("%d\n", result);
    return 0;
}
