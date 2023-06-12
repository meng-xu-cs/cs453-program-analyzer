#include <stddef.h>
#include <sys/types.h>

/* external interfaces */
ssize_t read(int fd, void *buffer, size_t count);
int printf(const char *format, ...);

/* exposed interfaces */
inline __attribute__((always_inline))
ssize_t in(void *buffer, size_t count) {
    return read(0, buffer, count);
}

inline __attribute__((always_inline))
int out(const char *message) {
    return printf("%s", message);
}

void abort(void);