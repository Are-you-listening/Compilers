
#include <stdio.h>

typedef int appel;
typedef const appel const kaas;

int main(){
    kaas k = 3;
    appel z = k;
    printf("%d %d", k, z);
    return 0;
};
