#include <stdio.h>

int main(){
    char* buf = calloc(50, sizeof(char));

    FILE* fp = fopen("../example_source_file/includes/io.txt", "r");

    fgets(buf, 50, fp);

    fp = fopen("../example_source_file/includes/io.txt", "w");

    fputs(buf,fp);

    fclose(fp);

    return 0;
}
