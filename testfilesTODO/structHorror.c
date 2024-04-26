#include <stdio.h>

struct kaas{
    int melk;
    float fermtented;
    char lol;
    char* zeta;
};

int main() {
   struct kaas ementaler;

   ementaler.melk = 1;
   ementaler.fermtented = 18.9;
   ementaler.lol = 'l'
   ementaler.zeta = &(ementaler.lol)
   printf("%d %f %c %c", ementaler.melk,ementaler.fermtented, ementaler.lol, *(ementaler.zeta));

    return 0;

}
