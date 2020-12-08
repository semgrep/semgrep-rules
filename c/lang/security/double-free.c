#include <stdlib.h>

int bad_code1() {
    char *var = malloc(sizeof(char) * 10);
    // ruleid: double-free
    free(var);
    free(var);
    return 0;
}

int okay_code1() {
    char *var = malloc(sizeof(char) * 10);
    // ok: double-free
    free(var);
    var = NULL;
    free(var);
    return 0;
}

int okay_code2() {
    char *var = malloc(sizeof(char) * 10);
    // ok: double-free
    free(var);
    var = malloc(sizeof(char) * 10);
    free(var);
    return 0;
}
