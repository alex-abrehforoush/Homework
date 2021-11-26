#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>

int childMain(long long int n)
{
	long long int m = n;
	key_t key = ftok("shmfile", 65);
	int shmid = shmget(key, 1024, 0666|IPC_CREAT);
	while(1)
	{
		long long int result = (long long int) shmat(shmid, (void*)0, 0);
		result = m;
		shmdt(result);
		if(m % 2 == 0)
		{
			m /= 2;	
		}
		else
		{
			m = 3 * m + 1;
		}
		printf("%lld, ", m);
		if(m == 1) break;
	}

}
int parentMain(n)
{
	key_t key = ftok("shmfile", 65);
	int shmid = shmget(key, 1024, 0666|IPC_CREAT);
	while(1)
	{
		long long int result = (long long int) shmat(shmid, (void*)0, 0);
		if(result != 1)
		{
			//printf("%lld, ", result);
		}
		else
		{
			//printf("%lld", result);
		}
		shmdt(result);
		//printf("%lld, ", result);
		if(result == 1) break;
	}
	shmctl(shmid, IPC_RMID, NULL);
}
///////////////////////////////////////////////////////////////////  
int main()
{
	long long int n = 0;
	printf("Enter n: ");
	scanf("%lld", &n);
	int rc = fork();
	if(rc < 0)
	{
	}
	else if(rc == 0)
	{
		childMain(n);
	}
	else
	{
		parentMain(n);
	}
	return 0;
}