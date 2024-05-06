

#include<stdio.h>

struct b{
    int a;
};

struct a{
    struct b* b_ptr;
    struct b b_value;
};


int main()
{

    struct b b1;
    struct b b2;

    b1.a = 5;
    b2.a = 7;

    struct a a1;
    a1.b_value = b1;
    a1.b_ptr = &b2;

    printf("%d", a1.b_value.a);
    printf("%d", a1.b_ptr->a);
    printf("%d", (*a1.b_ptr).a);

    struct a* a2 = &a1;

    printf("%d", a2->b_value.a);
    printf("%d", a2->b_ptr->a);
    printf("%d", (*a2->b_ptr).a);

    return 0;
}

