#include<stdio.h>
#include<pthread.h>
#include<semaphore.h>
#include<stdlib.h>

char msg[1000];
sem_t semaphore;
void * writer(){
    //while(1){
        sem_wait(&semaphore);
        printf("Message : %s\n",msg);
    
}
void * reader(){
    //while(1){
        printf("Enter a message: ");
        scanf("%s",msg);
        sem_post(&semaphore);
    
}

int main(){
    pthread_t tid1,tid2;
    
    sem_init(&semaphore,0,0);
    pthread_create(&tid1,NULL,reader,NULL);

    pthread_create(&tid2,NULL,writer,NULL);

    pthread_join(tid1,NULL);
    pthread_join(tid2,NULL);
}