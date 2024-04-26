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
   struct kaas gouda = ementaler;
   int z[1];
   z[0] = 2;

   ementaler.melk = 1;
   ementaler.fermtented = 18;
   printf("%d", ementaler.melk );
   printf("%d", ementaler.fermtented);


//   struct kaas gouda;
//
//      gouda.melk = 2;
//   gouda.fermtented = 7;
//   printf("%d", gouda.melk );
//   printf("%d", gouda.fermtented);
//
//      printf("%d", ementaler.melk );
//   printf("%d", ementaler.fermtented);

    struct kaas* gouda_ptr = &ementaler;
    //printf("%d   ", (*gouda_ptr).melk );
    //printf("%d   ", (*gouda_ptr).melk );


    return 0;

}
