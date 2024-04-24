#include <stdio.h>

int cry;

struct kaas{
    int melk;
    int fermtented;
};

struct kaas2{
    int melk;
    int fermtented;
    struct kaas* test;
    struct kaas*** test3;
};

int main() {
//    int z[1];
//    z[0] = 5;

   struct kaas ementaler;
   ementaler.melk = 1;
   ementaler.fermtented = 18;


   printf("%d", ementaler.melk );

   printf("%d", ementaler.fermtented);
//
//   printf("%d", z[0]);


    return 0;

}
