#include <stdio.h>

int main(){

    FILE* fp = fopen("files/test2.txt", "w");

    fputs("file content",fp);

    return 0;

}