#include <stdio.h>

int d(int a){

    return 1;
}


int main() {
    int c[2] = {1, 2};

    int (*e)(int) = &d;
    int u = (*e)(c);
    printf("%d", u);
    return 0;
}