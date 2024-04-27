#include <stdio.h>

struct kaas{
    int melk;
};

struct pointer{
    struct kaas* kaas_ptr;
};


int main() {
    struct kaas gouda;

    struct pointer ptr;
    ptr.kaas_ptr = &gouda;


    /*printf("%d", (*(ptr.kaas_ptr)).melk); // Need support for this!*/


    printf("%d", kaas_ptr.melk);
    /* This should thrown an semantic error */
    return 0;
}
