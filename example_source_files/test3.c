int main ()
{
    int x = -20;
    int a = -x ;
    int b = -(-x);
    int c = +(-x);

    printf("%d", x);
    printf("%d", a);
    printf("%d", b);
    printf("%d", c);

    return 0;
}