int main () {
const int x = 5*(3/10 + 9/10);
float y = x*2/( 2+1 * 2/3 +x) +8 * (8/4);
y = x + y;
int z;
float* flt_ptr = &y;
char ch = 'x';
const int* ptr_to_int = &z;
ptr_to_int = &x; // this is allowed. The pointer now points to variable x
*ptr_to_int = 33; // this is NOT allowed!
}