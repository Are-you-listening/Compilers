#include <stdio.h>

int foo(float foo){
    printf("%f\n", foo);
    return foo;
}

int main(){
    int x = foo(3.14);
    printf("%d\n", x);
    return 0;
}