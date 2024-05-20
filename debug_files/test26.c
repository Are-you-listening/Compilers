#include <stdio.h>

enum Direction {
NORTH,
EAST,
SOUTH,
WEST,
};

int main()
{
/* NORTH++;  This should thrown an semantic error because */
/* const int* appel = &peer; This should also give an error */
int peer = 1;
int* appel = &peer;
appel--;
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