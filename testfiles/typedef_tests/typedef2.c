typedef int kaas;
typedef const kaas beer;

int main(){

    kaas beer = 3;
    beer > 3; // Use the identifier beer,  not the typedef beer!

    return 0;
};