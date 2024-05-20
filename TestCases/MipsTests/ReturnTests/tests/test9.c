#include <stdio.h>

int d(int w){
    printf("%d", w);
    return w;
}

float e(){
    return 5.67;
}

int main() {
    int b = 6;
    b = 4;

    int a = d(b);
    printf("%d", a);
    a =e();
    printf("%d", a);
    return 0;
}