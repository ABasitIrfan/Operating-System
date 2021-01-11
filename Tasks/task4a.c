#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<unistd.h>

int main()

{

int a[10]={0,7,5,3,1,9,2,8,6,4};

printf("THE UNSORTED ARRAY IS :\n\n ");

for(int i = 0 ; i< 10 ; i++ )

   {
printf("\n%d",a[i]);
   }

int pid;

pid = fork();

int c = 0;

if (pid != -1)
{

if (pid == 0)
                   {

for (int i =0; i< 10; i++)

                {

for (int j =0; j < 10; j++)

                        {

if ( a[i] < a[j] )

                                {

                                        c = a[i];

a[i] = a[j];

a[j] = c;

                                }

                        }

                }

printf ("\nTHE SORTED ARRAY IS: ");

for (int i=0; i<10; i++)

                {

                    printf ("\n%d",a[i]);

                }

        }

}

else

        {

printf ("ERROR!!");

        }





return 0;

}


            
 
