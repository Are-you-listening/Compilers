#include <stdio.h>

struct kaas{
    int melk;
    float fermtented;
    char lol;
};

int main() {
   struct kaas ementaler;

   ementaler.melk = 1;
   ementaler.fermtented = 18.9;
   ementaler.lol = 'l';
   printf("%d %d %c", ementaler.melk, (int) (ementaler.fermtented*1000), ementaler.lol);

    return 0;

}
