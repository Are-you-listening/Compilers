#include <stdio.h>
#include <stdlib.h>

int main(){
    int i = 1000;

    char* char_buff = malloc(i);

    int j = 0;
    for (j = 0; j < i; j++){
        *(char_buff+j) = 'a' + (j % 30);
    }

    FILE* fp = fopen("files/test7.txt", "w");

    fputs(char_buff,fp);

    fclose(fp);

    fp = fopen("files/test7.txt", "r");

    char* char_buff2 = malloc(i);

    fgets(char_buff2, i, fp);

    printf("%s", char_buff2);

    return 0;

}