#include <stdio.h>
#include <unistd.h>
#include <sys/syscall.h>

struct pr
{
    char name[20];
    pid_t pid;
};
int main(void)
{
	int i = 0;
	struct pr p[20];
	int s;
	while (1)
	{
		int ret = syscall(550, p, &s);
		//printf("Hello world %d\n", ret);
		for (int i = 0; i < ret; i++)
		{
			printf("name: %s, pid: %d\n", p[i].name, p[i].pid);
			fflush(stdout);
		}
		sleep(2);
	}
	return 0;
}
