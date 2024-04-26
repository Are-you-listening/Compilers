#include <stdio.h>

struct kaas{
    int melk;
    int fermtented;
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

    struct kaas* gouda_ptr = &ementaler;
    printf("%d   ", (*gouda_ptr).melk );


    int a = (int) (*gouda_ptr).melk * 3.45 || 36;


    return 0;
}
