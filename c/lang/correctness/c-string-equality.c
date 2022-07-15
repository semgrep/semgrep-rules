#include <stddef.h>
#include <string.h>

int main()
{
    char *s = "Hello";

    // ruleid:c-string-equality
    if (s == "World") {
        return -1;
    }

    // ok:c-string-equality
    if (strcmp(s, "World") == 0) {
        return 1;
    }

    // ok:c-string-equality
    if (!strcmp(s, "World")) {
        return 1;
    }

    // ok:c-string-equality
    if (s == 0) {
      return 1;
    }

    // ok:c-string-equality
    if (NULL == s) {
      return 1;
    }

    return 0;
}
