#include <stdio.h>
#include <stdlib.h>

int main(){
    int i = 1000;

    char* char_buff = malloc(i);

    int j = 0;
    for (j = 0; j < i; j++){
        *(char_buff+j) = 'a' + (j % 100);
    }
    *(char_buff+999) = '\0';

    FILE* fp = fopen("files/test7.txt", "w");

    fputs(char_buff,fp);

    return 0;

}