#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <signal.h>
#include <stdlib.h>
#include <time.h>

#define MAX_CHILD 5
#define MAXIMUM 10

void task(int fd[2], char buffer[256]);


int main()
{
    int total = 0;
    int fd[2];
    char buffer[256];
    int x = pipe(fd);
    printf("fd = %d\n", fd[0]);
    pid_t child[MAX_CHILD];
	for(int i = 0; i < MAX_CHILD; i++)
	{
		child[i] = fork();
		if (child[i] == 0) // in child
		{
			task(fd, buffer);
        }
        else // in parent
        {
            close(fd[1]);
            while(1)
            {
                printf("in parent...\n");
                int r = 0;
                if(read(fd[0], &r, sizeof(r)) > 0)
                {
                    printf("message from child: %s\n", buffer);
                    total += r;
                    printf("total = %d\n", total);
                    if (total > MAXIMUM)
                    {
                        kill(0, SIGKILL);
                        exit(0);
                    }
                }
                else
                {
                    printf("pipe is not available\n");
                }
            }
        }
	}

    return 0;
}

void task(int fd[2], char buffer[256])
{
    close(fd[0]);
    srand(time(NULL) + getpid());
    while(1)
    {
        printf("in child...\n");
        int r = rand() % 5 + 1;
        sleep(r);
        write(fd[1], &r, sizeof(r));
    }
}