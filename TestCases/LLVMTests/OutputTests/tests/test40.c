#include <stdio.h>

int main(){
    const int x = 3;
    int* ptr = &x;
    --(*ptr);
    printf("%d", x);
    return 0;
}