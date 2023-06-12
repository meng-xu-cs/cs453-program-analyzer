#include <stddef.h>
#include <sys/types.h>

/* external interfaces */
ssize_t read(int fd, void *buf, size_t count);

/* exposed interfaces */
inline __attribute__((always_inline))
ssize_t read_stdin(void *buf, size_t count) {
    return read(0, buf, count);
}