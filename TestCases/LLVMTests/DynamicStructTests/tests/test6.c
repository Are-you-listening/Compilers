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

int equal(char* a, char* b){
    int index = 0;
    while (1){
        char a_char = *(a+index);
        char b_char = *(b+index);

        if (a_char == '\0' && b_char == '\0'){
            return 1;
        }

        if (a_char == '\0' || b_char == '\0'){
            return 0;
        }

        if (a_char != b_char){
            return 0;
        }

        index++;

    }
}


void addEntry(struct map* map, char* key, int value){
    int a = ++(map->size);
    map->nodes = realloc(map->nodes, sizeof(struct mapEntry)*a);
    (map->nodes+(a-1))->map_key = key;
    (map->nodes+(a-1))->map_value = value;

}

int getEntry(struct map* map, char* key){

    int i;
    for (i = 0; i < map->size; i++){
        char* map_key = (map->nodes+i)->map_key;
        if (equal(map_key, key)){
            return (map->nodes+i)->map_value;
        }

    }

    return -1;
}




struct map* create_map(){
    struct map* m = malloc(sizeof(struct map));
    m->size = 0;
    m->nodes = malloc(sizeof(struct mapEntry));

    return m;
}


int main() {

    struct map* m = create_map();
    addEntry(m, "lala", 5);
    printf("%d", m->size);

    printf("%d", equal("aaa", "aa"));
    printf("%d", equal("aaa", "abb"));
    printf("%d", equal("aaa", "aaa"));
    printf("%d", equal("aaa", ""));


    int v = getEntry(m, "lala");
    printf("%d", v);




    free(m);


    return 0;
}