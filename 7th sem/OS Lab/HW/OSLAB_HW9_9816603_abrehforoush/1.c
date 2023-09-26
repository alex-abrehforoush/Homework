#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

#define THREADS 5
#define SIZE 19
#define TIMEOUT 3

int A[SIZE];
int stride = SIZE / 2;
sem_t sem1;

void *routine1(void * thread_id)
{
    //*t = rand() % TIMEOUT;
    //int t = rand()%TIMEOUT; //replace two above lines with this line
    int min = A[*(int*)thread_id] * (A[*(int*)thread_id] <= A[*(int*)thread_id + stride]) + A[*(int*)thread_id + stride] * (A[*(int*)thread_id] > A[*(int*)thread_id + stride]);
    min = min * (min <= A[2 * stride]) + A[2 * stride] * (A[2 * stride] < min);
    // for(int i=0; i<*t; i++)
    // {
    //     printf("threadIdx = %d; run = %d\n", *(int*)x, i);
    // }
    A[*(int*)thread_id] = min;
    pthread_exit(NULL);
}
int main ()
{
    srand(time(NULL));
    for (int i = 0; i < SIZE; i++)
    {
        A[i] = SIZE - i;
    }
    while(stride > 0)
    {
        pthread_t threads[stride];
        int thread_id[stride];
        for (int i = 0; i < stride; i++)
        {
            thread_id[i] = i;
            pthread_create(&threads[i], NULL, routine1, (void *)&thread_id[i] );
            //replace two above lines with the below line
            //pthread_create(&threads[i], NULL, routine1, (void *)&i );
        }
        int *retval = (int*)malloc(sizeof(int));
        for (int i = 0; i < stride; i++)
        {
            pthread_join(threads[i], (void**)&retval);
        }
        free(retval);
        stride /= 2;
    }
    printf("%d\n", A[0]);
    return 0;
}