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
   char b = ementaler.lol;
   printf("%d %f %c %c", ementaler.melk,ementaler.fermtented, ementaler.lol, b);

    return 0;

}
