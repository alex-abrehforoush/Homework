#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>
#include <stdlib.h>

sem_t occ; //occupied slots

void* produce(void* arg)
{
	while(1)
	{
        sem_post(&occ);
        sleep(rand() % 100 * 0.01);
	}
}

void* consume(void* arg)
{
	while(1)
	{
		sem_wait(&occ);
        sleep(rand() % 100 * 0.01);
	}
}

int main(int argv, char* argc[])
{
	pthread_t producer, consumer;
	pthread_attr_t a1;
	sem_init(&occ, 0, 0);
	pthread_attr_init(&a1);
	pthread_attr_setdetachstate(&a1, PTHREAD_CREATE_JOINABLE);
	if(pthread_create(&producer, &a1, produce, 0))
	{
		printf("Failed to create producer thread!\n");
		exit(-1);
	}
	if(pthread_create(&consumer, &a1, consume, 0))
	{
		printf("Failed to create consumer thread!\n");
		exit(-1);
	}
	pthread_attr_destroy(&a1);
	if(pthread_join(producer, 0))
	{
		printf("Failed to join producer thread!\n");
	}
	if(pthread_join(consumer, 0))
	{
		printf("Failed to join consumer thread!\n");
	}
	pthread_exit(0);
	return 0;
}