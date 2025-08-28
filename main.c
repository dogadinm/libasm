#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
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

static void test_ft_write(void){
    printf("\n[ft_write / ft_read errno handling]\n");

    ssize_t w = ft_write(1, "hello\\n", 6);
    printf(" write stdout -> %zd (errno=%d)\n", w, errno);

}


static void test_ft_write_read_errno(void) {
    ssize_t w = ft_write(1, "hello\\n", 6);
    // Force an error: invalid FD
    errno = 0;
    w = ft_write(-1, "oops", 4);
    printf(" write(-1) -> %zd, errno=%d (%s)\n", w, errno, strerror(errno));


    // Force an error for read as well
    errno = 0;
    char tmp[8];
    ssize_t r = ft_read(-1, tmp, sizeof tmp);
    printf(" read(-1) -> %zd, errno=%d (%s)\n", r, errno, strerror(errno));
}

int test_ft_read(void){
    const char* filename = "test.txt";
    FILE *file = fopen(filename, "r");

    if (file == NULL) {
        perror("Erro to open file");
        return 1; 
    }

    char line[256]; 

    while (fgets(line, sizeof(line), file)) {
        printf("%s", line);
    }
    printf("\n");

    fclose(file);
    return 0;
}

void	ft_strdup_test(void)
{
	printf("\n--------------ft_strdup---------------\n\n");
	printf("strdup \t\t [%s]\n", strdup("test1"));
	printf("ft_strdup \t [%s]\n", ft_strdup("test1"));
	printf("\n\n");
	printf("strdup \t\t [%s]\n", strdup("this is a very looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong string to test a function"));
	printf("ft_strdup \t [%s]\n", ft_strdup("this is a very looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong string to test a function"));
	printf("\n\n");
	printf("strdup \t\t [%s]\n", strdup(""));
	printf("ft_strdup \t [%s]\n", ft_strdup(""));
}


int main(void) {
    test_ft_strlen();
    test_ft_strcpy();
    test_ft_strcmp();
    test_ft_write_read_errno();
    test_ft_write();
    test_ft_read();
    ft_strdup_test();
    return 0;
}
