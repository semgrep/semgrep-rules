#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

int bad_code1() {
    int fd;
    char buf[16];

    // ruleid: random-fd-exhaustion
    fd = open("/dev/urandom", 0);
    memset(buf, 0, sizeof(buf));
    read(fd, buf, sizeof(buf));

    return 0;
}

int okay_code1() {
    int fd;
    int bytes_read;
    char buf[16];

    // ok: random-fd-exhaustion
    fd = open("/dev/urandom", 0);
    memset(buf, 0, sizeof(buf));
    bytes_read = read(fd, buf, sizeof(buf));
    if (bytes_read != sizeof(buf)) {
        return -1;
    }

    return 0;
}

int bad_code2() {
    int fd;
    char buf[16];

    // ruleid: random-fd-exhaustion
    fd = open("/dev/random", 0);
    memset(buf, 0, sizeof(buf));
    read(fd, buf, sizeof(buf));

    return 0;
}

int okay_code2() {
    int fd;
    int bytes_read;
    char buf[16];

    // ok: random-fd-exhaustion
    fd = open("/dev/random", 0);
    memset(buf, 0, sizeof(buf));
    bytes_read = read(fd, buf, sizeof(buf));
    if (bytes_read != sizeof(buf)) {
        return -1;
    }

    return 0;
}
