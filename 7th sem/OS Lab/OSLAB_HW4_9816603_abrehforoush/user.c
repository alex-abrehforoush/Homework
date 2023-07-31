#include <sys/ioctl.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "utils.h"
#include <stdio.h>


int main(int argc, char **argv)
{
    int fd, ret;
    struct iut_data *iut_data1 = malloc(sizeof(struct iut_data));

    memset(iut_data1, 0, sizeof(struct iut_data));
    iut_data1->arg1 = 100;

    fd = open("/dev/iut_device", O_RDWR);
    if (fd < 0) {
        perror("open");
        exit(0);
    }
    ret = ioctl(fd, Command1 , iut_data1);
    ret = ioctl(fd, Command2, iut_data1);
    printf("%d\n", iut_data1->arg1);
    if (ret < 0) {
        perror("ioctl");
        exit(0);
    }
    close(fd);
    free(iut_data1);
    return 0;
}
