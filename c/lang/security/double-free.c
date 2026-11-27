#include <stdlib.h>
#include <string.h>

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

// return separates two mutually exclusive cleanup paths
int okay_code3_return_separates(int error) {
    char *var = malloc(sizeof(char) * 10);
    if (!error) {
        free(var);
        return 0;
    }
    // ok: double-free
    free(var);
    return -1;
}

// goto-based error handling with return between free calls
int okay_code4_goto_pattern(int flag) {
    char *buf = malloc(100);
    if (flag) {
        free(buf);
        return 0;
    }
    // ok: double-free
    free(buf);
    return -1;
}

// calloc reallocation between frees
int okay_code5_calloc() {
    char *var = malloc(sizeof(char) * 10);
    free(var);
    var = calloc(20, sizeof(char));
    // ok: double-free
    free(var);
    return 0;
}

// realloc between frees
int okay_code6_realloc() {
    char *var = malloc(sizeof(char) * 10);
    free(var);
    var = realloc(NULL, 20);
    // ok: double-free
    free(var);
    return 0;
}

// strdup between frees
int okay_code7_strdup() {
    char *var = strdup("hello");
    free(var);
    var = strdup("world");
    // ok: double-free
    free(var);
    return 0;
}
