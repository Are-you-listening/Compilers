#include <stdio.h>

union kaas{
    int melk;
    float yoghurt;
};




int main() {
    union kaas gouda;

    gouda.melk = 5;
    gouda.yoghurt = 3.14;

    printf("%f %f", gouda.melk , gouda.yoghurt);

    return 0;
}