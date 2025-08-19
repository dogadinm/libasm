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

static void test_ft_strcpy(void) {
    char buf[64];

    printf("\n[ft_strcpy]\n");
    printf(" src=\"kek\" -> '%s'\n", ft_strcpy(buf, "kek"));
    printf(" src=\"longer string\" -> '%s'\n", ft_strcpy(buf, "longer string"));
}

static void test_ft_strcmp(void) {
    printf("\n[ft_strcmp]\n");
    printf(" cmp('abc','abc') = %d\n", ft_strcmp("abc","abc"));
    printf(" cmp('abc','abd') = %d\n", ft_strcmp("abc","abd"));
    printf(" cmp('abd','abc') = %d\n", ft_strcmp("abd","abc"));
    printf(" cmp('\\xFF','\\x00') (unsigned) = %d\n", ft_strcmp("\xFF", "\x00"));
}

int main(void) {
    test_ft_strlen();
    test_ft_strcpy();
    test_ft_strcmp();
    return 0;
}