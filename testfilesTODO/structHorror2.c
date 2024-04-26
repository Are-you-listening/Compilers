#include <stdio.h>

struct kaas{
    int melk;
    float fermtented;
    char lol;
    char* zeta; // TODO Pointers other then struct pointers are not yet possible
};

int main() {
   struct kaas ementaler;

   ementaler.melk = 1;
   ementaler.fermtented = 18.9;
   ementaler.lol = 'l';
   char b = ementaler.lol;
   printf("%d %f %c", ementaler.melk,ementaler.fermtented, ementaler.lol);

    return 0;

}
