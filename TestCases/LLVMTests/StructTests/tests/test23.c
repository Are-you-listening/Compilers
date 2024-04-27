#include <stdio.h>

struct kaas{
    int melk;
    float fermtented;
    char lol;
    char* zeta;
};

struct pointer{
    struct kaas* kaas_ptr;
};


int main() {
   struct kaas ementaler;
   ementaler.lol = 'l';
   ementaler.zeta = &(ementaler.lol);

    struct pointer ptr;
    ptr.kaas_ptr = &ementaler;


    printf("%c", *(ptr.kaas_ptr).lol);  /* This is an error too! */


    return 0;
}
