#include <stdio.h>

struct kaas{
    int melk;
};

struct pointer{
    struct kaas* kaas_ptr;
};


int main() {
    struct kaas gouda;
    gouda.melk = 1;

    struct pointer ptr;
    ptr.kaas_ptr = &gouda;

    printf("%d", (*(ptr.kaas_ptr)).melk);

    return 0;
}
