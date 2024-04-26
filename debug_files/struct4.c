#include <stdio.h>

struct kaas{
    int melk;
};

int main() {
   int melk = 1;

   int* ptr = &melk;
   int z[1] = {melk};

   struct kaas ementaler;
   ementaler.melk = melk;

   struct kaas* gouda_ptr = &ementaler;

   printf("%d %d %d", ementaler.melk, z[0], (*gouda_ptr).melk);



//    struct kaas* gouda_ptr2 = gouda_ptr;
//    struct kaas** gouda_ptr_ptr = &gouda_ptr;

//    printf("%d", (*gouda_ptr).fermtented);


    return 0;

}
