#include <stdio.h>

int main(){

    char buffer[50];

    FILE* fp = fopen("files/test2.txt", "w");

    fputs("file content",fp);

    printf("%s", buffer);

    return 0;

}