#include <stdio.h>

int main() {
    //ruleid: info-leak-on-non-formated-string
    printf(argv[1]);

    return 0;
}
