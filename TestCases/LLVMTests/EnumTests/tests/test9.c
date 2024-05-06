
/*Proof enums don't conflict with typedefs*/
#include<stdio.h>

int x = 1;

enum week{Mon, Tue, Wed, Thur, Fri, Sat, Sun};


int main()
{
    enum week day;
    day = Wed;
    printf("%d",day);


    if (day == Wed){
        day = Thur;
    }

    printf("%d",day);

    return 0;
}

