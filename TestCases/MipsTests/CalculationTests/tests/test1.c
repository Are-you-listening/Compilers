#include <stdio.h>

int main(){
    int a = 0;
    a = 33 + 69789 * (69421 / 51213 + (2231 - 654));
    printf("%d", a);

    a = 654 * (15486 - (15000 + 486));
    printf("%d", a);

    a = 1 && (1 || 0);
    printf("%d", a);
    a = 0 && (1 && 1);
    printf("%d", a);
    a = 0 || (0 * 3);
    printf("%d", a);
    a = 1 && (!(1 + 0));
    printf("%d", a);
    a = 12 + (98721 + 36265 / 456 ) * (0 + 1687);
    printf("%d", a);
    a = 12 + (98721*0 + 36265 / 456 ) * (0);
    printf("%d", a);

    a = (12321 > (9656 + 3));
    printf("%d", a);
    a = (125154 < (54 > -65));
    printf("%d", a);

    a = 987842121 >= 212;
    printf("%d", a);

    a = -6549 <= (2189+63);
    printf("%d", a);
    a = 0 >= (-564654);
    printf("%d", a);

    a = 540 != 58973;
    printf("%d", a);
    a = -5 != -5;
    printf("%d", a);

    a = (-5*20) != ((-4 * 25));
    printf("%d", a);

    a = 9 % 10;
    printf("%d", a);
    a = 19 % 10;
    printf("%d", a);
    a = 8971 % 8;
    printf("%d", a);

    a = 1024 << 4;
    printf("%d", a);
    a = 2048 >> 3;
    printf("%d", a);
    a = 2048 >> -3;
    printf("%d", a);


    a = 23423 ^ 7345345;
    printf("%d", a);
    a = 843 & -86;
    printf("%d", a);
    a = 954 | 976;
    printf("%d", a);
    a = !9736;
    printf("%d", a);

    return 0;
}

