#include <stdio.h>
#include <stdlib.h>

int main() {
    const char *float_str = "3.1415926535897932384626433832";
    const char *int_str = "9999999999999999999999999";
    int read;

    float f;
    double d;
    long double ld;

    // ruleid:incorrect-use-sscanf-fn
    read = sscanf(float_str, "%f", &f);

    // ruleid:incorrect-use-sscanf-fn
    read = sscanf(float_str, "%lf", &d);

    // ruleid:incorrect-use-sscanf-fn
    read = sscanf(float_str, "%llf", &ld);

    // ruleid:incorrect-use-sscanf-fn
    read = sscanf(float_str, "%Lf", &ld);

    // ok:incorrect-use-sscanf-fn
    f = strtof(float_str, NULL);

    // ok:incorrect-use-sscanf-fn
    d = strtod(float_str, NULL);

    // ok:incorrect-use-sscanf-fn
    ld = strtold(float_str, NULL);

    int i;
    long int li;
    long long int lli;
    unsigned int ui;
    unsigned long int uli;
    unsigned long long int ulli;

    // ruleid:incorrect-use-sscanf-fn
    read = sscanf(int_str, "%d", &i);

    // ruleid:incorrect-use-sscanf-fn
    read = sscanf(int_str, "%ld", &li);

    // ruleid:incorrect-use-sscanf-fn
    read = sscanf(int_str, "%lld", &lli);

    // ruleid:incorrect-use-sscanf-fn
    read = sscanf(int_str, "%Ld", &lli);

    // ruleid:incorrect-use-sscanf-fn
    read = sscanf(int_str, "%u", &ui);

    // ruleid:incorrect-use-sscanf-fn
    read = sscanf(int_str, "%lu", &uli);

    // ruleid:incorrect-use-sscanf-fn
    read = sscanf(int_str, "%llu", &ulli);

    // ruleid:incorrect-use-sscanf-fn
    read = sscanf(int_str, "%Lu", &ulli);

    // ok:incorrect-use-sscanf-fn
    li = strtol(int_str, NULL, 0);

    // ok:incorrect-use-sscanf-fn
    lli = strtoll(int_str, NULL, 0);

    // ok:incorrect-use-sscanf-fn
    uli = strtoul(int_str, NULL, 0);

    // ok:incorrect-use-sscanf-fn
    ulli = strtoull(int_str, NULL, 0);

    return 0;
}
