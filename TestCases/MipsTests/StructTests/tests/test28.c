#include <stdio.h>

union kaas{
    int melk;
    float yoghurt;
    int* lol;
};

int main() {
    union kaas gouda;

    gouda.melk = 5;
    gouda.yoghurt = 3.14;

    printf("%d\n", (int) (gouda.yoghurt*1000));

    gouda.melk = 7;

    printf("%d\n", gouda.melk);


    return 0;
}
