#include <stdio.h>
#include <stdlib.h>



struct v{
    int u;
};

int l(struct v i){
    i.u = 6;
    return i.u;
}

int main() {


    struct v k;
    k.u = 5;

    printf("%d", k.u);
    printf("%d", l(k));
    printf("%d", k.u);




    return 0;
}