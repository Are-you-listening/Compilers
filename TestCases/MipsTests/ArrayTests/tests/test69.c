#include <stdio.h>
#include <stdlib.h>




int l(int v[3]){
    printf("%d%d%d", v[0], v[1], v[2]);
    v[0] = 8;
    return v[2];
}

int main() {


    int v[3] = {1,2,3};
    l(v);

    printf("%d%d%d", v[0], v[1], v[2]);




    return 0;
}