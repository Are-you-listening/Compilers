#include <stdio.h>
#include <stdlib.h>

int main(){
    int i = 1000;

    char* char_buff = malloc(i);

    int j = 0;
    for (j = 0; j < i; j++){
        *(char_buff+j) = 'A' + (j % 20);
    }

    FILE* fp = fopen("files/test8.txt", "w");

    fputs(char_buff,fp);

    fclose(fp);

    char* char_buff2 = malloc(i);
    fp = fopen("files/test8.txt", "r");
    fgets(char_buff2, i, fp);
    printf("%s", char_buff2);
    fclose(fp);

    return 0;

}