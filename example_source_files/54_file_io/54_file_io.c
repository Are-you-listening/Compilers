#include <stdio.h>
#include <stdlib.h>
int main(){
    char* buf = calloc(50, sizeof(char));

    FILE* fp = fopen("../includes/io.txt", "r");

    fgets(buf, 50, fp);

    fp = fopen("../includes/io.txt", "w");

    fputs(buf,fp);

    fclose(fp);

    return 0;
}
