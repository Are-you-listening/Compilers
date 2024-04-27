#include <stdio.h>


int d(){
    printf("%d", 1);
    return 1;
}


int main() {
    int (*e)() = &d;
    int u = (*e)();
    printf("%d", u);
    return 0;
}