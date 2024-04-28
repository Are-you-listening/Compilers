#include <stdio.h>

void increment() {
    int count = 0;
    printf("%d\n", ++count);
}

int main() {
    increment();
    increment();
    increment();
    return 0;
}