#include <stdio.h>

int f(int (*z)()){
    int v = (*z)();
    return v;
}

int d(){
    printf("%d", 1);
    return 1;
}


int main() {
    int (*e)() = &d;
    int u = (*e)();
    printf("%d", u);

    int y = f(e);
    printf("%d", y);
    return 0;
}