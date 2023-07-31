#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

#define THREADS 5
#define SIZE 20
#define TIMEOUT 3

int A[SIZE];
int B[SIZE];
int product = 0;
sem_t sem1;

void *routine1(void * thread_id)
{
    //*t = rand() % TIMEOUT;
    //int t = rand()%TIMEOUT; //replace two above lines with this line
    printf("thread_id = %d started...\n",*(int*)thread_id);
    int sum = 0;
    for(int i = *(int*)thread_id; i < SIZE; i += THREADS)
    {
        sum += A[i] * B[i];
    }
    // for(int i=0; i<*t; i++)
    // {
    //     printf("threadIdx = %d; run = %d\n", *(int*)x, i);
    // }
    sem_wait(&sem1);
    product += sum;
    sem_post(&sem1);
    pthread_exit(NULL);
}
int main ()
{
    srand(time(NULL));
    for (int i = 0; i < SIZE; i++)
    {
        A[i] = rand() % 2;
        B[i] = rand() % 2;
    }
    sem_init(&sem1, 0, 1);
    pthread_t threads[THREADS];
    int thread_id[THREADS];

    for (int i = 0; i < THREADS; i++)
    {
        thread_id[i] = i;
        pthread_create(&threads[i], NULL, routine1, (void *)&thread_id[i] );
        //replace two above lines with the below line
        //pthread_create(&threads[i], NULL, routine1, (void *)&i );
    }
    int *retval = (int*)malloc(sizeof(int));
    for (int i = 0; i < THREADS; i++)
    {
        pthread_join(threads[i], (void**)&retval);
        printf("thread_id %d finished\n", i);
    }
    for (int i = 0; i < SIZE; i++)
    {
        printf("%d, ", A[i]);
    }
    printf("\n");
    for (int i = 0; i < SIZE; i++)
    {
        printf("%d, ", B[i]);
    }
    printf("\n");
    printf("inner product of A and B = %d\n", product);
    free(retval);
    return 0;
}