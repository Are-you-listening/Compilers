#include <stdio.h>

struct kaas{
    char lol;
};

struct pointer{
    struct kaas* kaas_ptr;
};


int main() {
struct kaas ementaler;
   ementaler.lol = 'l';

    struct pointer ptr;
    ptr.kaas_ptr = &ementaler;

    printf("%c", (*ptr.kaas_ptr).lol);

    return 0;
}
