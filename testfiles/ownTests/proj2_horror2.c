int main() {

int x = 478;
int b = -251454;

int* b_ptr = &b;

int** x_ptr = &b_ptr;
x_ptr = &b;
x_ptr = x_ptr / 5; // Should not be possible
x_ptr = x_ptr / 5;
x_ptr = 3 / 5;
}