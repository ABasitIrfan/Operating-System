#include<stdio.h>
#include<pthread.h>

void * show(void * u)
{
char *msg;
msg = (char *) u;
printf("%s",msg);
}

void main() {
char *str = "Basit Irfan";
pthread_t tid;
pthread_create(&tid,NULL,&show,(void *)str);
pthread_join(tid,NULL);
}
