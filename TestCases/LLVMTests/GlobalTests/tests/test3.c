//Enum Semantic Error

#include<stdio.h>

int x = 1;



int main()
{
    enum week day;
    day = Wed;
    printf("%d",day);

    enum week{Mon, Tue, Wed, Thur, Fri, Sat, Sun};
    printf("%d",Tue);
    return 0;
}
