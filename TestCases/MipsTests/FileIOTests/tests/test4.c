#include <stdio.h>

int main(){

    char buffer[50];

    FILE* fp = fopen("files/test1.txt", "r");

    fgets(buffer, 50, fp);

    printf("%s", buffer);

    fclose(fp);

    return 0;

}