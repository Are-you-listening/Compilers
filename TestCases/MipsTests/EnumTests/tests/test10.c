

#include<stdio.h>

int x = 1;

enum week{Mon, Tue, Wed, Thur, Fri, Sat, Sun};

struct Schedule{
    enum week* day_ptr;
};


int main()
{
    enum week day;

    struct Schedule scheduler;

    scheduler.day_ptr = &day;

    scheduler.day_ptr = Wed;
    printf("%d",scheduler.day_ptr);


    if (day == Wed){
        scheduler.day_ptr = Thur;
    }

    printf("%d",scheduler.day_ptr);

    return 0;
}

