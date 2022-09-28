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

struct NAME {
  char first_name[32];
  int auth;
};
int bad_code3(){
    struct NAME *var;
    var = malloc(sizeof(auth));
    // ruleid: use-after-free
    free(var);
    if(var->auth){
        printf("you have logged in already");
    }
    else{
        printf("you do not have the permision to log in.");
    }
    return 0;

}


int ok_code3(){
    struct NAME *var;
    var = malloc(sizeof(auth));
    // ok: use-after-free
    free(var);
    var=NULL;
    if(var->auth){
        printf("you have logged in already");
    }
    else{
        printf("you do not have the permision to log in.");
    }
    return 0;

}
