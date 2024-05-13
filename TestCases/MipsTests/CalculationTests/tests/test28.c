
#include <stdio.h>

enum Direction {
NORTH,
EAST,
SOUTH,
WEST,
};

int main()
{
 //NORTH++;  /* This should thrown an semantic error because */

int peer = 1;
const int* const appel = &peer;
--appel;

appel++;
++appel;
printf("%d ", peer);

(*appel)--;
printf("%d ", peer);
(*appel)++;
printf("%d ", peer);

--(*appel);
printf("%d ", peer);

--appel;

/* --(peer+peer); This is not allowed /
--(peer);
--(appel);
/ appel + --appel; This returns an semantic error*/
return 0;
}