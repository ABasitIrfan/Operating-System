#include<stdio.h>
struct process 
{
    int p;
    int bt;
    int wt;
    int tat;
    int at;
    int ct;
};
void main() {
process p[10];
int n,temp;
printf("Enter the number of processes:\n");
scanf("%d",&n);

for(int i=0;i<n;i++){
printf("Enter the burst time of P[%d]:\n",i);
scanf("%d",&p[i].bt);
p[i].p=i+1;
}
// for(int i=0;i<n;i++){
// printf("Enter the arrival time of P[%d]:\n",i);
// scanf("%d",&at[i]);
// }
for(int i=0;i<n;i++)
{
    for(int j=i+1;j<n;j++)
    {
        if(p[i].bt<p[j].bt)
        {
          //swapping burst time
          temp=p[i].bt;
          p[i].bt=p[j].bt;
          p[j].bt=temp;
          //swapping process number
          temp=p[i].p;
          p[i].p=p[j].p;
          p[j].p=temp;
        }
    }
}

printf("\nProcess Number - Burst Time\n");
for(int i=0;i<n;i++){
    printf("%d \t\t %d\n",p[i].p,p[i].bt);
}
