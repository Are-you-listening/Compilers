#include <stdio.h>

struct kaas{
    int melk;
    float yoghurt;
};

int mul( struct kaas* a){
    return a->melk * a->yoghurt;
}

int main() {
    struct kaas gouda;

    gouda.melk = 5;
    gouda.yoghurt = 3.14;

    printf("%d %d       lol", gouda.melk , (int) (gouda.yoghurt*1000));

    struct kaas* ptr = &gouda;

    printf("%d", mul(ptr));

    return 0;
}