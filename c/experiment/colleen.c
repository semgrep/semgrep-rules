#include <stdio.h>

int DST_BUFFER_SIZE = 120;

int bad_code(src, dst) {
    n = DST_BUFFER_SIZE;
    if ((dst != NULL) && (src != NULL) && (strlen(dst)+strlen(src)+1 <= n))
    {
        strcpy(dst, src);
    }
    
    char str[50];
    printf("Enter a string : ");
    gets(str);
}

int main() {
   printf("Hello, World!");
   return 0;
}
