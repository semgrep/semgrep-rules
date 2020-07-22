#include <stdio.h>

int DST_BUFFER_SIZE = 120;

int bad_code(src, dst) {
    n = DST_BUFFER_SIZE;
    if ((dst != NULL) && (src != NULL) && (strlen(dst)+strlen(src)+1 <= n))
    {
        //ruleid: c-bad-functions
        strcpy(dst, src);
    }
    
    char str[50];
    printf("Enter a string : ");
    //ruleid: c-bad-functions
    gets(str);
    
    //ruleid: c-bad-functions
    scanf("hello%swhat");
    //ruleid: c-bad-functions
    scanf("hello");
    
    printf("hello");
    //ruleid: c-bad-functions
    printf("hello%n%n%n");
    //ruleid: c-bad-functions
    printf("hello%100x");
}

int main() {
   printf("Hello, World!");
   return 0;
}
