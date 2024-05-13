#include <stdio.h>

char* d(){
    char* c = "blabla";
    return c;
}

int main() {
    char* c = "t";
    c = d();
    printf("%s", c);
    return 0;
}