#include <stdio.h>
#include <stdlib.h>

typedef struct name {
    char *myname;
    void (*func)(char *str);
} NAME;

void other_func(char *ignored) {}

int bad_code1() {
    NAME *var;
    var = (NAME *)malloc(sizeof(struct name));
    free(var);
    // ruleid: use-after-free
    var->func("use after free");
    return 0;
}

int okay_code1() {
    NAME *var;
    var = (NAME *)malloc(sizeof(struct name));
    free(var);
    var = NULL;
    // This will segmentation fault
    // ok: use-after-free
    var->func("use after free");
    return 0;
}

int bad_code2() {
    NAME *var;
    var = (NAME *)malloc(sizeof(struct name));
    free(var);
    // ruleid: use-after-free
    other_func(var->myname);
    return 0;
}

int okay_code2() {
    NAME *var;
    var = (NAME *)malloc(sizeof(struct name));
    free(var);
    var = NULL;
    // This will segmentation fault
    // ok: use-after-free
    other_func(var->myname);
    return 0;
}

struct NAME {
  char first_name[32];
  int auth;
} s_auth;

int bad_code3(){
    struct NAME *var;
    var = malloc(sizeof(s_auth));
    free(var);
    // ruleid: use-after-free
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
    var = malloc(sizeof(s_auth));
    free(var);
    var=NULL;
    // ok: use-after-free
    if(var->auth){
        printf("you have logged in already");
    }
    else{
        printf("you do not have the permision to log in.");
    }
    return 0;

}

struct lv {
    int length;
    char *value;
} lv;

struct lv2 {
    int length;
    struct lv *lv;
} lv2;


int bad_code4(){
    int initial = 1000;
    struct lv *lv = malloc(sizeof(*lv));
    lv->length = initial;
    lv->value = malloc(initial);
    free(lv);
    // ruleid: use-after-free
    free(lv->value);
    return 0;
}

int ok_code4(){
    int initial = 1000;
    struct lv *lv = malloc(sizeof(*lv));
    lv->length = initial;
    lv->value = malloc(initial);
    // ok: use-after-free
    free(lv->value);
    // ok: use-after-free
    free(lv);
    return 0;
}

int bad_code5(){
    int initial = 1000;
    struct lv *lv = malloc(sizeof(*lv));
    lv->length = initial;
    lv->value = malloc(initial);

    struct lv2 *lv2 = malloc(sizeof(*lv2));
    lv2->length = initial;
    lv2->lv = lv;
    // ok: use-after-free
    free(lv2->lv);
    // ruleid: use-after-free
    free(lv2->lv->value);
    // ok: use-after-free
    free(lv2);
    return 0;
}


int ok_code5(){
    int initial = 1000;
    struct lv *lv = malloc(sizeof(*lv));
    lv->length = initial;
    lv->value = malloc(initial);

    struct lv2 *lv2 = malloc(sizeof(*lv2));
    lv2->length = initial;
    lv2->lv = lv;
    // ok: use-after-free
    free(lv2->lv->value);
    // ok: use-after-free
    free(lv2->lv);
    // ok: use-after-free
    free(lv2);
    return 0;
}

int bad_code6() {
    NAME *var;
    var = (NAME *)malloc(sizeof(struct name));
    free(var);
    // ruleid: use-after-free
    (*var).func("use after free");
    return 0;
}

int ok_code6() {
    NAME *var;
    var = (NAME *)malloc(sizeof(struct name));
    free(var);
    var = (NAME *)malloc(sizeof(struct name));
    // ok: use-after-free
    (*var).func("use after free");
    return 0;
}


int bad_code7() {
    char *var;
    char buf[10];
    var = (char *)malloc(100);
    free(var);
    // ruleid: use-after-free
    char buf[0] = var[0];
    // todo rule/id: use-after-free	// todo
    strcpy(buf, var);
    return 0;
}
