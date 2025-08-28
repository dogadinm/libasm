#include <stdlib.h>
#include <string.h>
#include <errno.h>

char *ft_strdup(const char *s)
{
    if (s == NULL) {
        errno = EINVAL;   // 22: Invalid argument
        return NULL;
    }

    size_t len = ft_strlen(s) + 1;  // +1 for '\0'
    char *new_str = (char *)malloc(len);
    if (new_str == NULL)
        return NULL;

    ft_strcpy(new_str, s);
    return new_str;
}