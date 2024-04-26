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

    printf("%d %d ", (*gouda_ptr).melk, (**gouda_ptr_ptr).melk);




//    struct kaas* gouda_ptr2 = gouda_ptr;
//    struct kaas** gouda_ptr_ptr = &gouda_ptr;

//    printf("%d", (*gouda_ptr).fermtented);


    return 0;

}
