#include <stdio.h>

int d(int a){
    printf("%d", a);
    return a;
}


int main() {
    int c = 1;
    int (*e)(int) = &d;
    int u = (*e)(c);
    printf("%d", u);
    return 0;
}