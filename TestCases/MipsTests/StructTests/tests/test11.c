#include <stdio.h>


int main() {

    struct kaas{
    int melk;
    };

    struct kaas gouda;
    gouda.melk = 3;
    printf("%d", gouda.melk);


    return 0;

}