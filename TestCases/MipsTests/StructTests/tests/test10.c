#include <stdio.h>

int x = 1;

enum week{Mon, Tue, Wed, Thur, Fri, Sat, Sun};

struct kaas{
int melk;
};

int main() {

    struct kaas gouda;
    gouda.melk = Mon;

    printf("%d", gouda.melk);



    return 0;

}