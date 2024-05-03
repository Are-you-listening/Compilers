#include <stdio.h>

int foo(){
    int x = 3;
    int y = x;
    int z;
    {{{{{{{{{{
        z = x;
    }}}}}}}}}}
    return z;
}

int main() {
    int temp = foo();
    printf("%d", temp);
    return 0;
}