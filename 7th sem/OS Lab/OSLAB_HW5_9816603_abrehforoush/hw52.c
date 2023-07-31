#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>


int main()
{
	srand(time(NULL));
	while(1)
	{
		struct timeval start, stop;


		//srand(time(NULL));
		int r = rand() % 5 + 1;

		char path[128] = "";
		sprintf(path, "%s", "/home/oslab/Desktop/HW5/app");
		char arg0[128] = "";
		sprintf(arg0, "%s", "app");
		char arg[128] = "";
		sprintf(arg, "%d", r);
        	
		gettimeofday(&start, NULL);
		
		time_t start_t;
		struct tm * start_info;
		time(&start_t);
		start_info = localtime(&start_t);

		int child = fork();
		if (child == 0)
		{
			execl(path, arg0, arg, NULL);
			exit(0);
		}
		else
		{
			wait(NULL);
			gettimeofday(&stop, NULL);
			long sec = stop.tv_sec - start.tv_sec;
			float m1 = start.tv_usec;
			float m2 = stop.tv_usec;
			long elapsed = sec * 1000 + (m2 - m1) / 1000;
			printf("%s, %d, %d\n", asctime(start_info), elapsed, r);
		}
		
	}
	return 0;
}
