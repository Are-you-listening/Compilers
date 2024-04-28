int main() {

int x = 478;
int b = -251454;

int* b_ptr = &b;

int** x_ptr = &b_ptr;
x_ptr = &(b+1); // This should not be possible
    return 0;

}