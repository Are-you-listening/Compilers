#include <stdio.h>

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
    int z[1] = {1};

   struct kaas ementaler;
   ementaler.melk = 1;

   printf("%d", ementaler.melk);

   printf("%d", z[0]);


    return 0;

}
