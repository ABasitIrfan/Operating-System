#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>

int main()
{
        key_t key = ftok("kauseruddin",109);
// shmget returns an identifier in shmid
int shmid = shmget(key,1024,0666|IPC_CREAT);
// shmat to attach to shared memory
char *str = (char*) shmat(shmid,NULL,0);
printf("write data");
scanf("%s",str);
printf("Data written in memory: %s\n",str);
//detach from shared memory
shmdt(str);
return 0;
}
 
