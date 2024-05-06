#include <stdio.h>


struct cheese{
    int milk;
};

int main(){
    struct cheese gouda;
    gouda.milk = 3;

    char* c = "wdwdwd";
    struct cheese* gouda_ptr = (struct cheese*) c;



    return 0;
}