#include <stdio.h>

struct kaas{
    int melk;
    int fermtented;
};

struct pointer{
    struct kaas* kaas_ptr;
};


int main() {
   struct kaas ementaler;

   ementaler.melk = 1;
   ementaler.fermtented = 18;
   printf("%d", ementaler.melk );
   printf("%d", ementaler.fermtented);


   struct kaas gouda;

      gouda.melk = 2;
   gouda.fermtented = 7;
   printf("%d", gouda.melk );
   printf("%d", gouda.fermtented);

      printf("%d", ementaler.melk );
   printf("%d", ementaler.fermtented);
    //struct kaas* gouda_ptr = &ementaler;
    //printf("%d   ", (* (int) (pointer.kaas_ptr + 1 + 2 + 3 )).melk );
    //printf("%d   ", (*gouda_ptr).melk );


    return 0;

}
