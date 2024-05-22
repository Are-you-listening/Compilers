#include <stdio.h>

int* arrayCreator(int* array_2, int value){
    for(int i = 0; i < 5; i++){
        array_2[i] = value;
    }
    return array_2;
}

int main() {
    int* array_2[5];
    int* array = arrayCreator(array_2, 5);

    for(int i = 0; i < 5; i++){
        printf("%d ", array[i]);
    }

    return 0;
}