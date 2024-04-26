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

   struct kaas gouda = ementaler;

   printf("%d", gouda.melk );

   printf("%d", gouda.fermtented);

    return 0;

}


