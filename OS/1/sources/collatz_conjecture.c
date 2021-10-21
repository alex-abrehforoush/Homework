#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>

int main()
{
	int n = 0;
	printf("Enter n: ");
	scanf("%d", &n);
	int stat;
	while(n != 1)
	{
		int rc = fork();
		if(rc < 0)
		{
			fprintf(stderr, "Fork Failed!");
		}
		else if(rc == 0)
		{
			int m = n;
			if(m % 2 == 0)
			{
				m /= 2;
			}
			else
			{
				m = 3 * m + 1;
			}
			return m;
		}
		else
		{
			wait(&stat);
			printf("%d, ", n);
			fflush(stdout);
			n = WEXITSTATUS(stat);
			if(n == 1) printf("%d", n);
		}
	}
	return 0;
}