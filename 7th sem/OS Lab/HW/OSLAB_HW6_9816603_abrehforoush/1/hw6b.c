#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <signal.h>
#include <string.h>

#define MAX_CHILD 5
#define MAXIMUM 50



int main()
{
    int total = 0;
    int fd[MAX_CHILD][2];
    memset(fd, 0, MAX_CHILD * 2 * sizeof(int));
    char buffer[MAX_CHILD][256];
    memset(buffer, 0, MAX_CHILD * 256 * sizeof(char));
    int x[MAX_CHILD];
    memset(x, 0, MAX_CHILD * sizeof(int));
    for (int i = 0; i < MAX_CHILD; i++)
    {
        x[i] = pipe(fd[i]);
        printf("fd = %d\n", fd[i][0]);
    }
    pid_t child[MAX_CHILD];
	for(int i = 0; i < MAX_CHILD; i++)
	{
		child[i] = fork();
		if (child[i] == 0) // in child
		{
			task(fd[i], buffer[i]);
        }
        else // in parent
        {
            close(fd[i][1]);
            while(1)
            {
                printf("in parent...\n");
                if(read(fd[i][0], buffer[i], 255) > 0)
                {
                    printf("message from child: %s\n", buffer[i]);
                    total += atoi(buffer[i]);
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
        sprintf(buffer, "%d", r);
        write(fd[1], buffer, 255);
    }
}