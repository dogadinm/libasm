#include <errno.h>
#include <stdlib.h>

size_t ft_strlen(const char *s) {
    if (s == NULL) {
        errno = EINVAL;
        return (size_t)-1;
    }

    size_t len = 0;
    while (s[len] != '\0') {
        len++;
    }
    return len;
}
