#include <stdio.h>

struct kaas{
    int melk;
};

struct pointer{
    struct kaas* kaas_ptr;
};

int lol(){
    struct kaas{
        int appel;
    };

    struct kaas gouda;
    gouda.appel = 1;

    gouda.melk = 1;
    return 0;
    //return gouda.melk;
}

int main() {
    struct kaas gouda;
    gouda.melk = 1;

    struct pointer ptr;
    ptr.kaas_ptr = &gouda;

    printf("%d", (*ptr.kaas_ptr).melk);

    lol();

    return 0;
}