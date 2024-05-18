#include <stdio.h>

int a (){
    return 1;
}

int e (){
    return 5;
}

int main(){
    int b = a() +e();
    printf("%d", b);
    int c = 5;

    c = 4+b;

    printf("%d", c);
    return 0;
}
