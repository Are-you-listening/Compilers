#include <stdio.h>

struct kaas{
    int melk;
};

int main() {
   int melk = 1;

   int* ptr = &melk;
   int z[1] = {1};

   struct kaas ementaler;
   ementaler.melk = 1;
   printf("%d", ementaler.melk);

    struct kaas* gouda_ptr = &ementaler;

    int** s = &z;

        struct kaas** gouda_ptr_ptr = &gouda_ptr;

    //printf("%d %d %d %d %d %d", ementaler.melk, z[0], *ptr, (*gouda_ptr).melk, s[0], (**gouda_ptr_ptr).melk);




//    struct kaas* gouda_ptr2 = gouda_ptr;
//    struct kaas** gouda_ptr_ptr = &gouda_ptr;

//    printf("%d", (*gouda_ptr).fermtented);


    return 0;

}
