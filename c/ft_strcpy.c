#include <errno.h>
#include <stdlib.h>

char *ft_strcpy(char *dst, const char *src)
{
    if (dst == NULL || src == NULL) {
        errno = EINVAL;
        return NULL;
    }

    char *original_dst = dst;

    while (*src != '\0') {
        *dst = *src;
        dst++;
        src++;
    }

    *dst = '\0';
    
    return original_dst;
}