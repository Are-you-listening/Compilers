#include <stdio.h>
#include <stdlib.h>
int main(){

    char buffer[5];



    FILE* fp = fopen("files/test1.txt", "r");

    fgets(buffer, 5, fp);

    printf("%s", buffer);

    int length = buffer[0];

    printf("%d", length);

    /*
    let length depend on first
    */
    char* c = malloc(length);
    fgets(c, length, fp);

    printf("%s", c);

    return 0;

}