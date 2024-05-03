#include <stdio.h>

#define NULL 0

void func1() {
    printf("d%", 1);
}

void func2() {
    printf("d%", 2);
}

int main() {
    void (*funcPtr)() = NULL;
    return 0;
}
