#include <stdio.h>

struct kaas{
    int melk;
};

struct pointer{
    struct kaas* kaas_ptr;
};


int main() {
    struct kaas gouda;
    gouda.melk = 8;

    struct pointer ptr;

    ptr.kaas_ptr = &gouda; // This is not yet possible but should be supported!


    printf("%d", gouda.melk);
    printf("%d", (*ptr.kaas_ptr).melk); // Need support for this!

    printf("%d", (kaas_ptr).melk); // This should thrown an semantic error
    return 0;
}
