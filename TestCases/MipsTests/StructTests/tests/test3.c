#include <stdio.h>

int cry;

struct kaas{
    int melk;
    int fermtented;
};

struct kaas2{
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

   struct kaas2 beemster;
   beemster.melk = 12;
   beemster.fermtented = 5;

   printf("%d", beemster.melk );
   printf("%d", beemster.fermtented);

    return 0;
}
