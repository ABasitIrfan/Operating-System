#!/bin/bash
result=$(zenity --entry --title="MAIN MENU" --width="800" --height="400" --text="
    1) File and Folder
    2) Application Management
    3) Process/Thread Management
    4) Data in Process
    5) Create/Execute/Delete Processes
    ")
    case $result in
    1) filefolders=$(zenity --entry --title="What do you want to create?" --width="800" --height="400" --text="
    1) Files
    2) Folders" )
      case $filefolders in
        1)file=$(zenity --entry --title="Choose the type of file" --width="800" --height="400" --text="
                .txt
                .c
                .sh
                Note: Your file will be created on Desktop
                rights")
          case $file in
            .txt)  filename=$(zenity --entry --title="Name your file" --width="800" --height="400") 
            touch $filename$file;;
            .c) filename=$(zenity --entry --title="Name your file" --width="800" --height="400") 
            touch $filename$file;;
            .sh) filename=$(zenity --entry --title="Name your file" --width="800" --height="400")
            touch $filename$file;;
            rights)rite=$(zenity --entry --title="For whom you want to change rights?" --width="800" --height="400" --text="
                1) Owner
                2) Group
                3) User
                4) Rights to all
                5) rights Yourself" )
                filerights=$(zenity --entry --title="Enter your file name with extention" --width="800" --height="400" --text="Note: Enter File name with Extension" )
                if [ $rite = 1 ]
                then
                    owner=$(zenity --entry --title="Owner" --width="800" --height="400" --text="
                1) only read
                2) only write
                3) only execute
                4) give to all" )
                case $owner in
                1) chmod 400 $filerights;;
                2) chmod 200 $filerights;;
                3) chmod 100 $filerights;;
                4) chmod 700 $filerights;;
                 *)zenity --error --title="Error" --text="Invalid option";;
                esac
                
                elif [ $rite = 2 ]
                then
                    group=$(zenity --entry --title="Owner" --width="800" --height="400" --text="
                1) only read
                2) only write
                3) only execute
                4) give to all" )
                case $group in
                1) chmod 040 $filerights;;
                2) chmod 020 $filerights;;
                3) chmod 010 $filerights;;
                4) chmod 070 $filerights;;
                 *)zenity --error --title="Error" --text="Invalid option";;
                esac
                
                elif [ $rite = 3 ]
                then
                    user=$(zenity --entry --title="Owner" --width="800" --height="400" --text="
                1) only read
                2) only write
                3) only execute
                4) give to all" )
                case $user in
                1) chmod 004 $filerights;;
                2) chmod 002 $filerights;;
                3) chmod 001 $filerights;;
                4) chmod 007 $filerights;;
                 *)zenity --error --title="Error" --text="Invalid option";;
                esac
                
                elif [ $rite = 4 ]
                then
                chmod 777 $filerights
                   
                elif [ $rite = 5 ]
                then
                yourself=$(zenity --entry --title="Give rights" --width="800" --height="400" --text="
                like 777" )
                   chmod $yourself $filerights
                   
                else
                     zenity --error --title="Error" --text="Invalid option"
                fi;;
            *)zenity --error --title="Error" --text="Invalid option";;
          esac;;
      2)folder=$(zenity --entry --title="Folder Name?" --width="800" --height="400" --text="
         Enter Folder Name 
         Note: Your Folder will be created on Desktop")
         mkdir $folder;;
     *)zenity --error --title="Error" --text="Invalid option";;
      esac
    ;;
  2)appmanage=$(zenity --entry --title="What do you want to do" --width="800" --height="400" --text="
    1) Search File/Application
    2) Open Application" )
    case $appmanage in
    1)zenity --title="Select a file" --file-selection
      zenity --info --title="FILE"  --text "File is successfully selected";;
    2)myvar=$(zenity --list --text="Chose a non-default program" --column="Programs" firefox libreoffice kcalc)
      $myvar &
      zenity --title=$myvar;;
     *)zenity --error --title="Error" --text="Invalid option";;
      esac

;;




3)processes=$(zenity --entry --title="What do you want to do?" --width="800" --height="400" --text="
    1) Kill Processes
    2) Create Processes" )
case $processes in
    1)choose=$(zenity --entry --title="Choose?" --width="800" --height="400" --text="
    1) Direct Enter Parent Id of the process you want to kill
    2) Search Parent Id with related name" )
    case $choose in
    1)kill=$(zenity --entry --title="Enter Parent Id of the process you want to kill" --width="800" --height="400" --text="
    Enter Parent id:" )
    kill $kill
    ;;
    2)pidsearch=$(zenity --entry --title="Enter Name of the process to seach pid?" --width="800" --height="400" --text="
    Enter Process name:" )
    ps aux | grep -i $pidsearch ;;
     *)zenity --error --title="Error" --text="Invalid option";;
    esac;;
    2) createtp=$(zenity --entry --title="What do you want to create?" --width="800" --height="400" --text="
    1) Process of Array Sorting
    2) Thread of Matrix" )
    case $createtp in
    1) gcc -o task4a task4a.c
    ./task4a;;
    2)gcc -o task4b task4b.c -lpthread
    ./task4b;;
     *)zenity --error --title="Error" --text="Invalid option";;
    esac
    ;;
 *)zenity --error --title="Error" --text="Invalid option";;
    
esac
;;

4)gcc -o write7 write7.c
./write7
gcc -o read7 read7.c
./read7 ;;



5)zenity --info --text="Hello user to the desirebale task"
  
choice=$(zenity --entry --text=" 
1) to create the file 
2) to execute your file
3) to delete that file")

case $choice in
        1) y=$(zenity --entry --width="800" --height="400" --text="Enter file name")
                vi $y.c
                ;;

        2)y=$(zenity --entry --width="800" --height="400" --text=" Enter file name to be executed")
         if [ -f "$y.c" ]
         then
                 zenity --info --text=" File exists "
                 gcc -o $y "$y.c"
                 ./"$y"
         else
                 zenity --error --title="Error" --text="Not exists first create a file"
         fi
                 ;;

         3)y=$(zenity --entry --width="800" --height="400" --text=" Enter file name to be removed")
          if [ -f "$y.c" ]
          then
                  zenity --info --text="File removed"
                  rm "$y.c"
          else
                 zenity --error --title="Error" --text="File is already removed/doesnt not exists"
          fi
          ;;

        *)zenity --error --title="Error" --text="Invalid option";;
esac;;

 *)zenity --error --title="Error" --text="Invalid option";;












    esac
