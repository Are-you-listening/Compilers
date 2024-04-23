
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
    int q = Thur- (Mon*Tue);
    printf("%d",Tue);
    printf("%d",Thur);
    printf("%d",Fri);
    printf("%d",Sat);
    printf("%d",q);
    printf("%d",Sun);
    q = Sun;
    printf("%d",q);
    return 0;
}

