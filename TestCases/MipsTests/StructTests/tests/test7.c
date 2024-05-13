#include <stdio.h>

int cry;

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

   gouda.melk = ementaler.melk;
   gouda.fermtented = ementaler.fermtented;

   printf("%d", gouda.melk );

   printf("%d", gouda.fermtented);

    return 0;

}


