#include <stdio.h>

struct kaas{
    int melk;
    float yoghurt;
};

struct kaas* structCreator(int melk, float yoghurt){
    struct kaas gouda;
    gouda.melk = melk;
    gouda.yoghurt = yoghurt;
    struct kaas* ptr = &gouda;
    return ptr;
}

int main() {
    struct kaas* ptr;

    ptr = structCreator(10, 20.0);
    printf("%d %d ", ptr->melk, (int) ptr->yoghurt);
    return 0;
}