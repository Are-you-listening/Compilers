#include <stdio.h>

struct kaas{
    int melk; //Melk
    float yoghurt;
};

struct kaas* structCreator(int melk, float yoghurt){ //Struct Creator
    struct kaas gouda;
    gouda.melk = melk;
    gouda.yoghurt = yoghurt;
    struct kaas* ptr = &gouda;
    return ptr;
}

int main() {
    struct kaas* ptr; //kaas* ptr definition in main

    ptr = structCreator(10, 20.0);
    printf("%d %f ", ptr->melk, ptr->yoghurt);
    return 0;
}