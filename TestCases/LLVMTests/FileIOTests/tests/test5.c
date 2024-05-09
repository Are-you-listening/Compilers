#include <stdio.h>
#include <stdlib.h>
int main(){

    char* c = malloc(50);

    FILE* fp = fopen("files/test1.txt", "r");

    fgets(c, 50, fp);

    printf("%s", c);

    return 0;

}