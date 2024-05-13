#include <stdio.h>

int foo(int foo){
    int x = foo;
    printf("%d", x);
    return foo;
}

int main() {
    int temp = foo(2);
    printf("%d", temp);
    return 0;
}