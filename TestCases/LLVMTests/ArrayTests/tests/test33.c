#include <stdio.h>


int main() {
    int z[5] = {1,2,3,4,5};


    int** s = &z; /*TODO crash in to llvm*/

    return 0;
}