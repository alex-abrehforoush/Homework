#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#define MAXCHILD 5


void task(int id);

int main()
{
	pid_t child[MAXCHILD];
	int status = 0;
	//int is_child = 0;
	for(int i=0; i < MAXCHILD; i++)
	{
		child[i] = fork();
		if (child[i] == 0)
		{
			//is_child = 1;
			task(i);
		}
	}
	
	
	// in Parent
	int child_d;
	while(1)
	{
		sleep(5);
		for(int i = 0; i < MAXCHILD; i++)
		{
			child_d = waitpid(child[i], &status, WNOHANG);
			if(child_d == 0)
			{
				printf("child[%d] is still alive\n", child[i]);
			}
			else if (child_d > 0)
			{
			 	printf("child[%d] is dead now\n", child[i]);
				child[i] = fork();
				if (child[i] == 0)
				{
					task(i);
				}
			}
			else
			{
			 	printf("no specific child to wait for \n");
			}
		}
	}
	return 0;
}

void task(int id)
{
	srand(time(NULL) + getpid());
	int r = rand() % 5 + 1;
	printf("Task %d has been done by child %d in %d seconds\n", id, getpid(), r);
	sleep(r);
	exit(0);
}
