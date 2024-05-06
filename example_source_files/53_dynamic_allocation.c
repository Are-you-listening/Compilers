struct cheese{
    int milk;
};

int main(){
    struct cheese gouda;
    gouda.milk = 3;

    struct cheese* gouda_ptr = (struct cheese*) malloc(sizeof(struct cheese));

    gouda_ptr = realloc(gouda_ptr, sizeof(struct cheese)*2);

    free(gouda_ptr);

    char* z = calloc(2, sizeof(char));
    z[0] = 'O';
    z[1] = 'Y';

    free(z);

    return 0;
}