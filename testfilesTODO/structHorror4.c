#include <stdio.h>

int cry;

struct kaas{
    int melk;
    int fermtented;
};

struct kaas2{
    struct kaas* test;
    struct kaas*** test3;
};

int main() {
   struct kaas ementaler;
   ementaler.melk = 1;
   ementaler.fermtented = 18;


   printf("%d", ementaler.melk );

   printf("%d", ementaler.fermtented);

   printf("%d", z[0]);

   struct kaas gouda;
   gouda.melk = 7;
   gouda.fermtented = 9;

   printf("%d", gouda.melk );

   printf("%d", gouda.fermtented);

   struct kaas* gouda_ptr = &gouda;
    printf("%d   ", (*gouda_ptr).melk );

    return 0;

}


