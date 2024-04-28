int main() {
    int a = 5;
    int* b = &a;

    int** c = &b;

    float** d = c;

    char** e = c;

    int** f = c;

    int*** g = c;

    return 0;
}