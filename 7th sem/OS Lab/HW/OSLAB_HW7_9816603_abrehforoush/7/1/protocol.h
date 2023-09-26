#ifndef PROTOCOL_H
#define PROTOCOL_H

#define NAME "/shmem-oslab"

#define NUM 5

#define ARRAY_S (NUM * sizeof(int))

#define STR_L 20

//
//#define ARRAY_SIZE 128
struct information
{
    int arr[NUM];
    char name[STR_L];
};
//

#endif