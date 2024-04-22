
#include<stdio.h>

int x = 1;

enum week{Mon, Tue, Wed, Thur, Fri, Sat, Sun};

typedef int enumweek;

int main()
{
    enum week day;
    enumweek z = 1;
    day = Wed;
    printf("%d",day);
    printf("%d",Mon);
    printf("%d",Tue);
    printf("%d",Thur);
    printf("%d",Fri);
    printf("%d",Sat);
    printf("%d",Sun);
    return 0;
}

