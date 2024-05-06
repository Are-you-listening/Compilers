#include <stdio.h>

int main(){

    FILE* fp = fopen("files/test3.txt", "w");

    fputs("file content\n hi",fp);

    return 0;

}