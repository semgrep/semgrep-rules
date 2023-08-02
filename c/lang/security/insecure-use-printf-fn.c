#include <stdio.h>

void bad_vsprintf(int argc, char **argv) {
    char format[256];

    //ruleid: insecure-use-printf-fn
    strncpy(format, argv[1], 255);
    char buffer[100];
    vsprintf (buffer,format, args);

    //ruleid: insecure-use-printf-fn
    vsprintf(buffer, argv[1], args);

    //ok: insecure-use-printf-fn
    vsprintf("%s\n",argv[0]);

    //ok: insecure-use-printf-fn
    vsnprintf(buffer, format, args);
}

void bad_sprintf(int argc, char **argv) {
    char format[256];

    int a = 10, b = 20, c=30;
    //ruleid: insecure-use-printf-fn
    strcpy(format, argv[1]);
    char buffer[200];
    sprintf(buffer, format, a, b, c);


    char buffer[256];
    int i = 3;
    //ruleid: insecure-use-printf-fn
    sprintf(buffer, argv[2], a, b, c);

    //ok: insecure-use-printf-fn
    sprintf("%s\n",argv[0]);

    //ok: insecure-use-printf-fn
    snprintf(buffer, format, a,b,c);
}

void bad_printf() {
    //ruleid: insecure-use-printf-fn
    printf(argv[2], 1234);

    char format[300];
    //ruleid: insecure-use-printf-fn
    strcpy(format, argv[1]);
    printf(format, 1234);

    //ok: insecure-use-printf-fn
    printf("hello");

    //ok: insecure-use-printf-fn
    printf("%s\n",argv[0]);
}

int main() {
    bad_vsprintf(NULL);
    bad_sprintf();
    bad_printf();
    return 0;
}
