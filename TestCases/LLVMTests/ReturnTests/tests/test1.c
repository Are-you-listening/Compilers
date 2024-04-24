#include <stdio.h>

int d(){
    return 2;
}

int main() {
    int a = 0;
    a = d();
    printf("%d", a);
    return 0;
}