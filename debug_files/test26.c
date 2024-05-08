#include <stdio.h>


union grammer_rule_production{
    struct grammar_rule* production;
    char terminal;
};

struct grammar_rule{
    struct grammar_rule* productions;
    int production_size;
    int is_terminal;
};

struct grammar{

};


int main() {



    return 0;
}