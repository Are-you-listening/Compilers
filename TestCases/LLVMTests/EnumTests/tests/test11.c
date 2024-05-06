
/*Proof enums don't conflict with typedefs*/
#include<stdio.h>

int x = 1;

enum week{Mon, Tue, Wed, Thur, Fri, Sat, Sun};


int main()
{
    enum week day;

    enum week* b = &day;

    *b = Wed;
    printf("%d",*b);


    if (day == Wed){
        *b = Thur;
    }

    printf("%d",*b);

    return 0;
}

