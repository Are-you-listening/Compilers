#include <stdio.h>
#include <stdlib.h>
struct cheese{
    int milk;
};

int main(){
    struct cheese gouda;
    int a = sizeof(gouda);

    return 0;
}