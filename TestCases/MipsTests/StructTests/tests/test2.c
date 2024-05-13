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
   gouda.melk = 7;
   gouda.fermtented = 9;

   printf("%d", gouda.melk );
   printf("%d", gouda.fermtented);

   printf("%d", ementaler.melk );
   printf("%d", ementaler.fermtented);

    return 0;

}
