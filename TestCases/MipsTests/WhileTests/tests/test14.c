#include <stdio.h>

int main() {
    char c = '\n';

    float f = 33.1;
    float final_line = 33.99895;

    f = f * 10000;
    int f_int = (int) f;

    final_line = final_line * 100000;
    int final_line_int = (int) final_line;


    printf("%d", final_line_int);
    printf("%d", f_int);
    printf("%c", c);

    return 0; /* I know this is no while test but this has a different runC command! */

} /* this shouldn't give problems */
