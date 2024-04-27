#include <stdio.h>

struct kaas{
    int melk;
};

int main() {
    struct kaas gouda;
    gouda.melk = 1;
    kaas.melk = 5; /* Kaas is an undeclared variable! */

    return 0;
}
