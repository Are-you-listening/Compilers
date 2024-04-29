#include <stdio.h>

struct kaas{
    int melk;
};

struct pointer{
    struct kaas* kaas_ptr;
};

int lol(){
    struct kaas{
        int melk;
    };

    struct kaas gouda;
    gouda.melk = 9;


    printf("%d", gouda.melk);

    return gouda.melk;
}

int main() {
    struct kaas gouda;
    gouda.melk = 1; /* This may not thrown a semantic error */
    printf("%d", gouda.melk);


    struct pointer ptr;
    ptr.kaas_ptr = &gouda;

    printf("%d", (*ptr.kaas_ptr).melk);

    gouda.melk = lol();

    printf("%d", gouda.melk);


    return 0;
}