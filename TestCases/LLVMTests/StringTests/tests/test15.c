#include <stdio.h>

int main(){


   printf("%d", printf("%d", printf("%s", "Boo") ) );

   printf("%s", printf("%s", printf("%s", "Boo") ) ); /* This should give conversion errors or warnings since %s accepts  strings and printf returns an integer */

    return 0;
}