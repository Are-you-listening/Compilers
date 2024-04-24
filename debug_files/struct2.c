#include <stdio.h>

enum week{
    Mon,
    Tue
};

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




    return 0;

}
