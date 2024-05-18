#include <stdio.h>

int a (int b){
    printf("%d", b);
    return 1;
}

int main(){
    a(a(4));
    return 0;
}
