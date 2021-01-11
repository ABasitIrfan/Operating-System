#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
char name[100];
char rn[10];
int main(int argc,char *n[]){
    int pid, pip[2];

    pipe(pip);

    pid=fork();
    if(pid==0) {
        //Child
        close(pip[0]);
        printf("Enter your name : ");
        scanf("%s",name);
        write(pip[1],&n,100);
    }
    else
    {
        sleep(10);
        //Parent
        close(pip[1]);
        printf("Enter your roll number : ");
        scanf("%s",rn);
        read(pip[0],name,100);
        printf("\nName: %s - Roll Number: %s\n",name,rn);
    }
    
}