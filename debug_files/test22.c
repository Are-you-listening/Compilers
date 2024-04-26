#include <stdio.h>

struct kaas{
    int melk;
    int fermtented;
};


int main() {
   struct kaas ementaler;

   struct kaas gouda;

   struct kaas* gouda_ptr = &ementaler;
   printf("%d   ", (*gouda_ptr).melk );



    return 0;
}
