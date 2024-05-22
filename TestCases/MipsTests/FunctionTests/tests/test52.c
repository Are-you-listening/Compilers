#include <stdio.h>

int foo(int a){
    if (a < 5){
        foo(++a);
        int foo = 0;
    }
    return 5;
}

int main() {
    printf("%d", foo(1));
    return 0;
}