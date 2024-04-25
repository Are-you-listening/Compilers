#include <stdio.h>

int d(int* w){
    printf("%d", *w);
    *w = 6;
    return *w;
}

float e(){
    return 5.67;
}

int main() {
    int c = 5;
    int* b = &c;

    int a = d(b);
    printf("%d", *b);
    printf("%d", a);
    a =e();
    printf("%d", a);
    return 0;
}