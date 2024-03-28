int main() {
const char c = 'a';
const char* chr_ptr = &c;
char* non_const_ptr = chr_ptr;
*non_const_ptr = 'c';

    return 0;

}
