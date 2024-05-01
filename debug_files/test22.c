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

    printf("%f\n", gouda.yoghurt);
    printf("%f\n", gouda.melk);

    gouda.melk = 7;

    printf("%d\n", gouda.melk);


    return 0;
}
