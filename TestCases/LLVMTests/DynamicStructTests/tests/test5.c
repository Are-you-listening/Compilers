#include <stdio.h>
#include <stdlib.h>

struct mapEntry{
    char* map_key;
    int map_value;
};

struct map{
    struct mapEntry* nodes;
    int size;
};

void addEntry(struct map* map, char* key, int value){

}

struct map* create_map(){
    struct map* m = malloc(sizeof(struct map));
    m->size = 0;

    return m;
}


int main() {

    struct map* m = create_map();
    printf("%d", m->size);

    free(m);


    return 0;
}