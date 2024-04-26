#include <stdio.h>

struct kaas{
    int melk;
};

int main() {
   struct kaas ementaler;
   ementaler.melk = 1;
   printf("%d", ementaler.melk);

    struct kaas* gouda_ptr = &ementaler;

    struct kaas** gouda_ptr_ptr = &gouda_ptr;

    printf("%d %d %d %d %d %d", ementaler.melk, (*gouda_ptr).melk, (**gouda_ptr_ptr).melk);








    return 0;

}
