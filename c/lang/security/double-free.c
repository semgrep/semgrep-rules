#include <stdlib.h>

int bad_code1() {
    char *var = malloc(sizeof(char) * 10);
    free(var);
    // ruleid: double-free
    free(var);
    return 0;
}

int okay_code1() {
    char *var = malloc(sizeof(char) * 10);
    free(var);
    var = NULL;
    // ok: double-free
    free(var);
    return 0;
}

int okay_code2() {
    char *var = malloc(sizeof(char) * 10);
    free(var);
    var = malloc(sizeof(char) * 10);
    // ok: double-free
    free(var);
    return 0;
}
