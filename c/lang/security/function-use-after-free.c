#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct name {
    char *myname;
    void (*func)(char *str);
} NAME;

void other_func(char *ignored) {}
void refreencode(char *ignored) {}

int bad_code1() {
    NAME *var;
    char buf[10];
    var = (NAME *)malloc(sizeof(struct name));
    free(var);
    // ruleid: function-use-after-free
    strcpy(buf, (char*)var);
    // ruleid: function-use-after-free
    other_func((char*)(*var));
    // ruleid: function-use-after-free
    other_func((char*)var[0]);
    // ruleid: function-use-after-free
    var->func(var->myname);
    return 0;
}

int bad_code2() {
    NAME *var;
    char buf[10];
    var = (NAME *)malloc(sizeof(struct name));
    free(var);
    // ruleid: function-use-after-free
    strcpy(buf, (char*)*var);
    // ruleid: function-use-after-free
    other_func((char*)var);
    // ruleid: function-use-after-free
    other_func((char*)var->myname);
    return 0;
}

int okay_code1() {
    NAME *var;
    var = (NAME *)malloc(sizeof(struct name));
    free(var);
    var = NULL;
    // This will segmentation fault
    // ok: function-use-after-free
    other_func((char*)var);
    other_func((char*)var->myname);
    other_func((char*)*var);
    return 0;
}

int okay_code2() {
    NAME *var;
    var = (NAME *)malloc(sizeof(struct name));
    free(var);
    var = NULL;
    var = (NAME *)malloc(sizeof(struct name));
    // This will segmentation fault
    // ok: function-use-after-free
    other_func((char*)var);
    other_func((char*)var->myname);
    other_func((char*)*var);
    return 0;
}
