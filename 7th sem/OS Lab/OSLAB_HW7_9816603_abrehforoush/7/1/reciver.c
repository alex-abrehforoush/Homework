#include "protocol.h"
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

int main()
{
    int fd = shm_open(NAME, O_RDONLY, 0666);
    if (fd<0) {
        perror("shm_open()");
        return EXIT_FAILURE;
    }

    //int size = ARRAY_S + STR_L;
    int size = 2 * sizeof(struct information);

    void *data = mmap(0, size, PROT_READ, MAP_SHARED, fd, 0);
    //void *data = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);must not conflict with the open mode of the file
    if(data == (void *)-1){
        perror("mmap()");
        return EXIT_FAILURE;
    }

    //int *array = (int *)data;
    //char *msg = (char *)(data + ARRAY_S);
    struct information *x = (struct information *)(data);
    
    printf("reciver address: %p\n", data);

    for (int i = 0; i < NUM; i++) {
        printf("first array num%d: %d\n", i, x[0].arr[i]);
        printf("second array num%d: %d\n", i, x[1].arr[i]);
    }

    //printf("msg: %s\n", msg);
    printf("my name is: %s\n", x[0].name);
    printf("my friend's name is: %s\n", x[1].name);
    

    munmap(data, size);

    close(fd);

    // delete file
    shm_unlink(NAME);
    return EXIT_SUCCESS;
}