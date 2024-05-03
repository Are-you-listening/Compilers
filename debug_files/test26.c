#include <stdio.h>

struct kaas{
    int melk;
};

struct pointer{
    struct kaas* kaas_ptr;
};


int main() {
    struct kaas gouda;
    struct kaas beemster;
    beemster.melk = 1;
    gouda.melk = 88;

    struct kaas z[2] = {gouda, beemster};

    printf("%d %d", (z[0]).melk, (z[1]).melk);
    return 0;
}
