#include <stdio.h>

int d(int a){
    return a;
}

float e(){
    return 5.67;
}

int main() {

    int a = d(5);
    printf("%d", a);
    a =e();
    printf("%d", a);
    return 0;
}