int main(){
    {
        int x = 1;
        {
            int x = 2;
            {
                int x = 3;
                {
                    int y = x; // y should be 3
                    {
                        int x = 4;
                        int z = x; // z should be 4
                        {
                            int x = 5;
                        }
                    }
                }
            }
        }
    }
    return 0;
}