#include <stdio.h>

struct kaas{
    int melk;
};

struct pointer{
    struct kaas* kaas_ptr;
};


int main() {
    struct kaas gouda;
    gouda.melk = 3;

    struct kaas* ptr;
    ptr = &gouda;

    printf("%d", ptr->melk);
    ;
    printf("%d", (*ptr).melk);


    return 0;
}
