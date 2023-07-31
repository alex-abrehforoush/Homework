#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#define FIFO_PATH "q2.pipe"

struct command
{
    char c;
    int a;
    int b;
};

int main()
{
    struct command cmnd;
	long r = 0;
	int fd;

	while(1)
	{
		printf("Enter c, a, and b:\n");
		cmnd.c = getchar();
		getchar();
		scanf("%d%d", &cmnd.a, &cmnd.b);
		
		if (cmnd.c != 'm' && cmnd.c != 'p')
		{
			printf("Wrong command\n");
			continue;
		}
		
		fd = open(FIFO_PATH, O_WRONLY);
        write(fd, &cmnd, sizeof(cmnd));
		//write(fd, &cmnd.a, sizeof(cmnd.a));	
		//write(fd, &cmnd.b, sizeof(cmnd.b));
		close(fd);

		fd = open(FIFO_PATH, O_RDONLY);
		read(fd, &r, sizeof(r));
		printf("result:%ld\n", r);
		close(fd);	
	}
	return 0;
}
