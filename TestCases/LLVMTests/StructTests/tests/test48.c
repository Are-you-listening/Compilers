#include <stdio.h>


union v{
    int a;
    float b;
    int c;
};

int main(){

    struct v a;

    union v* c = &a;


    return 0;
}