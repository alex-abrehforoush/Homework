#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <math.h>

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

	// ceate pipe
	mkfifo(FIFO_PATH, 0777);

	while(1)
	{
		fd = open(FIFO_PATH, O_RDONLY);
        read(fd, &cmnd, sizeof(cmnd));
		//read(fd, &cmnd.a, sizeof(cmnd.a));	
		//read(fd, &cmnd.b, sizeof(cmnd.b));
		close(fd);

		if (cmnd.c == 'm')
        {
            r = cmnd.a * cmnd.b;
        }
        else if(cmnd.c == 'p')
        {
            r = pow(cmnd.a, cmnd.b);
        }
		fd = open(FIFO_PATH, O_WRONLY);
		write(fd, &r, sizeof(r));
		close(fd);	
	}
	return 0;
}