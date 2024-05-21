#include <stdio.h>

int foo(float foo){
    printf("%d\n", (int) foo);
    return foo;
}

int main(){
    int x = foo(3.14);
    printf("%d\n", x);
    return 0;
}