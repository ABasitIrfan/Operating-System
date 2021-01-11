#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>

int main(int argc, char *argv[])
{
        FILE *pipe_fp, *infile;
        char buff[100];
        for(int i=0;i<argc;i++)
        {
            printf("%s\n",argv[i]);
        }
        
        if (argc != 3)
        {
                fprintf(stderr, "ERROR\nGive command and filename also\n");
                exit(1);
        }
        //file open
        if ((infile = fopen(argv[2], "aa.txt")) == NULL)
        {
                perror("fopen");
                exit(1);
        }
        //pipe open
        if ((pipe_fp = popen(argv[1], "sort")) == NULL)
        {
                perror("popen");
                exit(1);
        }
        while(fgets(buff, 100, infile))
                fputs(buff, pipe_fp);

        fclose(infile);
        pclose(pipe_fp);
        return(0);
}
 
