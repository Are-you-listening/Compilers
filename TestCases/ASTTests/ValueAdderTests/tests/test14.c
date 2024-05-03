#include <stdio.h>

const int globalConst = 100;

int computeSomething() {
    return globalConst + 10;
}

int computeSomethingElse() {
    return globalConst * 2;
}

int main() {
    printf("Result 1: %d\n", computeSomething());
    printf("Result 2: %d\n", computeSomethingElse());
    return 0;
}
