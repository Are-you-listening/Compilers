#include <stdio.h>
#include <stdlib.h>



struct v{
    int u[3];
};

int l(struct v i){
    printf("%d\n", i.u[1]);
    i.u[1] = 6;
    return i.u[1];
}

int main() {


    struct v k;
    int a = 5;

    k.u[1] = a;

    printf("%d\n", k.u[1]);
    printf("%d\n", l(k));
    printf("%d\n", k.u[1]);




    return 0;
}