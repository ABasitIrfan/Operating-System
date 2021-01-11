#include<stdio.h>
#include<unistd.h>
void main() {
int input=1;
while(input!=0){
printf("Enter 1 to continue or 0 to quit");
scanf("%d",&input);
int id=fork();
if(id != -1)
printf("process created");
}

}
