int main(){
    int x = 1;
    {
        int x = 3;
        int y = 2;
        int z = y + x;
        // local z should be 5
    }
    int z = x;
    // z should now be 1
}