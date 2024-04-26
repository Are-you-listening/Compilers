#include <stdio.h>

struct kaas{
    int melk;
};

int main() {
   struct kaas ementaler;
   ementaler.melk = 1;

   struct kaas* gouda_ptr = &ementaler;

   struct kaas** gouda_ptr_ptr = &gouda_ptr;
    printf("%d %d", ementaler.melk, (*gouda_ptr).melk);
   printf("%d %d %d %d %d %d", ementaler.melk, (*gouda_ptr).melk, (**gouda_ptr_ptr).melk);








    return 0;

}
