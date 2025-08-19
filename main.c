#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>
#include "libasm.h"

static void test_ft_strlen(void) {
    const char *a = "";
    const char *c = "42Network";
    const char *b = "hello"; 

    printf("[ft_strlen]\n");
    printf(" len(\"\") = %zu\n", ft_strlen(a));
    printf(" len(\"hello\") = %zu\n", ft_strlen(b));
    printf(" len(\"42Network\")= %zu\n", ft_strlen(c));
}

int main(void) {
    test_ft_strlen();
    return 0;
}