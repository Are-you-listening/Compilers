#include <stdio.h>

int d(int a){
    return a;
}

int main() {

    int (*e)(int) = &d;
    int c = (*e)(5);
    d(4);
    printf("%d", c);
    return 0;
}
