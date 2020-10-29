#include <stdlib.h>

typedef struct name {
    char *myname;
    void (*func)(char *str);
} NAME;

int bad_code1() {
    NAME *var;
    var = (NAME *)malloc(sizeof(struct name));
    // ruleid: use-after-free
    free(var);
    var->func("use after free");
    return 0;
}

int okay_code1() {
    NAME *var;
    var = (NAME *)malloc(sizeof(struct name));
    // ok: use-after-free
    free(var);
    var = NULL;
    // This will segmentation fault
    var->func("use after free");
    return 0;
}

int bad_code2() {
    NAME *var;
    var = (NAME *)malloc(sizeof(struct name));
    // ruleid: use-after-free
    free(var);
    other_func(var->myname);
    return 0;
}

int okay_code2() {
    NAME *var;
    var = (NAME *)malloc(sizeof(struct name));
    // ok: use-after-free
    free(var);
    var = NULL;
    // This will segmentation fault
    other_func(var->myname);
    return 0;
}
