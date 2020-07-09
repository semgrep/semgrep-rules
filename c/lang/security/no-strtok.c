#include <stdio.h>

int DST_BUFFER_SIZE = 120;

int bad_code() {
    char str[DST_BUFFER_SIZE];
    fgets(str, DST_BUFFER_SIZE, stdin);
    // ruleid:no-strtok
    strtok(str, " ");
    printf("%s", str);
    return 0;
}

int main() {
    char str[DST_BUFFER_SIZE];
    char dest[DST_BUFFER_SIZE];
    fgets(str, DST_BUFFER_SIZE, stdin);
    // ok
    strtok_r(str, " ", *dest);
    printf("%s", str);
    return 0;
}
}