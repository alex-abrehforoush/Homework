/*
this program initializes a signal action
assigns a handler to this action and waits for SIGINT (ctrl+c) to be handled
*/

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <signal.h>

// "handler" is handler function for action
void handler(int signo)
{
	switch(signo)
	{
		case SIGALRM:
		printf("I recieved alarm\n");
		break;
	}
}


int main()
{
	//initializing sigaction structure
	struct sigaction action;
	action.sa_handler = handler;
	action.sa_flags = 0;
	sigaction(SIGALRM, (struct sigaction *) &action, NULL);

	//printf("Process run by pid:%d\n", getpid());
    alarm(5);
	//runnign forever, while process is sensitive to SIGINT
	while(1)
    { 
		sleep(1);
        printf("I am alive!\n");
    }
	return 0;
}

