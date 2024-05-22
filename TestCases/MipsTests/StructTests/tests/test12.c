#include <stdio.h>

struct kaas{
int melk;
};


int main() {

    struct kaas{
    float melk;
    };

        struct kaas gouda;
    gouda.melk = 3.14;
    printf("%d", (int) (gouda.melk*1000));

    return 0;

}