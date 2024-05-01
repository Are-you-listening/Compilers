#include <stdio.h>

int global = 0;

float foo(int bar){
    if (global) {
        global = 1;
        foo(1);
    } else {
        printf("%d", bar);
    }
    return 0.0;
}

int main() {
    foo(2);
    return 0;
}