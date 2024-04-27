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
//   ementaler.lol = 'l';
//   ementaler.zeta = &(ementaler.lol);

    struct pointer ptr;
    //ptr.kaas_ptr = &ementaler;

    printf("%c %c %c", (*ptr.kaas_ptr).lol);
    //printf("%c %c %c", ementaler.lol, *ementaler.zeta, (*ptr.kaas_ptr).lol);

    /* printf("%c", *(ptr.kaas_ptr).lol);  This is an error too! */

    /* printf("%c %c %c", ementaler.lol, *ementaler.zeta, *(ptr.kaas_ptr).lol); Need errors for this, since kaas_ptr is a ptr and '.' is not allowed */

    return 0;
}
