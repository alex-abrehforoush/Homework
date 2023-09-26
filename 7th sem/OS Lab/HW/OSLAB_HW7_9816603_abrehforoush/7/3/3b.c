#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <string.h>
#include <time.h>
#include <signal.h>
#include "protocol.h"

void handler(int signo);
int task(int id, int * x);

int allow = 0;

int main()
{
    //acquiring shared memory
    int size = ARRAY_SIZE * sizeof(int);
    void *data = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, 0, 0);
    if(data == (void *)-1)
    {
        perror("mmap()");
        return EXIT_FAILURE;
    }
    int *x = (int *)(data);
    //making children
    pid_t child[MAX_CHILD];
	//int status = 0;
	int is_child = 0;
	for(int i = 0; i < MAX_CHILD; i++)
	{
		child[i] = fork();
		if (child[i] == 0)
		{
            printf("child %d created...\n", child[i]);
			is_child = 1;
			task(i, x);
		}
	}

	if (is_child == 0)//parent
	{
        for (int i = 0; i < ARRAY_SIZE; i++)
        {
            x[i] = i;
        }
        usleep(100000);
        for (int i = 0; i < MAX_CHILD; i++)
        {
            printf("sending signal...\n");
            kill(child[i], SIGUSR1);
        }
		for(int i = 0; i < MAX_CHILD; i++)
        {
            wait(NULL);
        }
		printf("All children have stopped!\n");
        for (int i = 0; i < ARRAY_SIZE; i++)
        {
            printf("%d\t", x[i]);
        }
	}
    munmap(data, size);
    return EXIT_SUCCESS;
}

void handler(int signo)
{
    printf("in handler...\n");
	switch(signo)
	{
		case SIGUSR1:
            //printf("Interrupt Signal received \n");
            allow = 1;
            break;
	}
}

int task(int id, int * x)
{
    //handle signal
    struct sigaction action;
	action.sa_handler = handler;
	action.sa_flags = 0;
	sigaction(SIGUSR1, (struct sigaction *) &action, NULL);
    // //read from shared memory
    // int fd = shm_open(NAME, O_RDWR, 0666);
    // if (fd < 0)
    // {
    //     perror("shm_open()");
    //     return EXIT_FAILURE;
    // }
    // int size = ARRAY_SIZE * sizeof(int);
    // void *data = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    // if(data == (void *)-1)
    // {
    //     perror("mmap()");
    //     return EXIT_FAILURE;
    // }
    // int * x = (int *)data;
    //doing the job
    printf("%d\n", id);
	while(1)
    {
        pause();
        if (allow == 1)
        {
            for (int i = id; i < ARRAY_SIZE; i += MAX_CHILD)
            {
                x[i] = 2 * x[i] + 1;
            }
        }
        break;
    }
    // delete file
    exit(0);
}