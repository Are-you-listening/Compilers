#include <stdio.h>

int main(){
    char a = 'a';
    int b = 1;
    float c = 5.6;

    const char d = a;
    printf("%c", d);
    const int e = d;
    printf("%d", e);
    const float f = e;


    char* g = &a;
    printf("%c", *g);
    int* h = &b;
    printf("%d", *h);
    float* i =&c;

    h++;
    printf("%d", *h);
    h--;
    printf("%d", *h);
    h = 0;

    /*
    Here is comment 2
    */

    char j;
    int m;
    float k;

    char l = *g;
    printf("%c", l);
    l++;
    printf("%c", l);
    l--;
    printf("%c", l);


    return 0;
}