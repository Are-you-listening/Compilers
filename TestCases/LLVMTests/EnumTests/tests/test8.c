#include <stdio.h>

enum week{Mon, Tue, Wed, Thur, Fri, Sat, Sun};

struct a{
   enum week day;
};

int main(){
    struct a b;
    b.day = Mon;

    printf("%d", b.day);

    return 0;

}