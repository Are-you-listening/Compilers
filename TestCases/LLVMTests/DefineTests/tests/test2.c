
// Proof enums don't conflict with typedefs
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
    return 0;
}

