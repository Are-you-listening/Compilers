#include <stdio.h>

int foo(int a){
    if (a < 5){

        int foo = 0;
        foo(++a);
    }
    return 5;
}

int main() {
    printf("%d", foo(1));
    return 0;
}