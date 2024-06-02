#include <stdio.h>
#include <stdlib.h>



union v{
    int* u;
};

int* l(union v i){

    *i.u = 6;
    return i.u;
}

int main() {


    union v k;
    int a = 5;
    k.u = &a;


    printf("%d", *k.u);
    printf("%d", *l(k));

    printf("%d", *k.u);




    return 0;
}