#include <stdio.h>

union kaas{
    int melk;
    float yoghurt;
};




int main() {
    union kaas gouda;

    gouda.melk = 5;
    printf("%d\n", gouda.melk);
    gouda.yoghurt = 3.14;

    printf("%d\n", (int) (gouda.yoghurt*1000));

    return 0;
}
