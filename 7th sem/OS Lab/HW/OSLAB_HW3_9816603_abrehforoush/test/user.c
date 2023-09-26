#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

int main(int argc, char** argv)
{
	char dev_name[2048];
	for (int i = 0; argv[1][i]; i++)
	{
		dev_name[i] = argv[1][i];
	}
	char buffer[2048];
	for (int i = 0; argv[2][i]; i++)
	{
		buffer[i] = argv[2][i];
	}
	// char path[9] = "/dev/tst1";
	if (buffer[0] == 't' || buffer[0] == 'd' || buffer[0] == 'w')
	{
		printf("hi\n");
		int fd = open("/dev/moshref", O_WRONLY);
		write(fd, buffer, strlen(buffer));
		close(fd);
	}
	else
	{
		int fd = open("/dev/moshref", O_RDONLY);
		memset(buffer, 0, 2048);
		read(fd, buffer, strlen(buffer));
		printf("%s\n", buffer);
		close(fd);
	}
	
	return 0;
}
