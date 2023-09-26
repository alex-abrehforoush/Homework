#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

#define N 5
#define TIMEOUT 3

sem_t chopstick[N];

void think(int thread_id)
{
    printf("Philosophore %d is thinking...\n", thread_id);
    int t = rand() % TIMEOUT;
    sleep(t);
}
int canEat(int thread_id)
{
    int a = 0;
    int b = 0;
    sem_getvalue(&chopstick[thread_id % N], &a);
    sem_getvalue(&chopstick[(thread_id + 1) % N], &b);
    return a + b == 2;
}
void eat(int thread_id)
{
    printf("Philosophore %d is hungry...\n", thread_id);
    sem_wait(&chopstick[thread_id % N]);
    sleep(1);
    sem_wait(&chopstick[(thread_id + 1) % N]);
    printf("Philosophore %d is eating...\n", thread_id);
    int t = rand() % TIMEOUT;
    sleep(t);
    sem_post(&chopstick[(thread_id + 1) % N]);
    sem_post(&chopstick[thread_id % N]);
}

void *routine1(void * thread_id)
{
    while (1)
    {
        think(*(int*)thread_id);
        while(!canEat(*(int*)thread_id));
        eat(*(int*)thread_id);
    }
    pthread_exit(NULL);
}

int main ()
{
    srand(time(NULL));

    for (int i = 0; i < N; i++)
    {
        sem_init(&chopstick[i], 0, 1);
    }
    pthread_t threads[N];
    int thread_id[N];
    for (int i = 0; i < N; i++)
    {
        thread_id[i] = i;
        pthread_create(&threads[i], NULL, routine1, (void *)&thread_id[i] );
        //replace two above lines with the below line
        //pthread_create(&threads[i], NULL, routine1, (void *)&i );
    }
    int *retval = (int*)malloc(sizeof(int));
    for (int i = 0; i < N; i++)
    {
        pthread_join(threads[i], (void**)&retval);
        printf("thread_id %d finished\n", i);
    }
    free(retval);
    return 0;
}