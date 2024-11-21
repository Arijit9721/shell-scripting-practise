#!/bin/bash

<< disclaimer
This script keeps the backup of a file for a rotational period of 5 files.

Running the script requires 2 arguments:
./backup.sh <path of the source file> <path of the backup folder>
disclaimer

     # checking for both arguments while running the file  
	if [ $# -lt 2 ]; then
	   echo "too few details!!"
   	   exit 1
	fi

     # neccessary global variables
	main=$2
   	backup=$1
	timestamp=$(date '+%y-%m-%d-%H-%M')
     	
     # downlading and installing the needed dependencies
	sudo apt install zip &> /dev/null 
   	if [ $? -ne 0 ]; then
	  echo "Setting up dependencies failed,exiting ..."
	  exit 1
	else
	  echo "successfully setup dependencies"
        fi

     # compressing the file and creating the backup
     zip "${backup}/backup_for_${timestamp}.zip" "$main" 
      if [ $? -ne 0 ]; then
          echo "Backup creation failed,exiting ..."
          exit 1
        else
          echo "backup created successfully"
      fi

     # storing all the backups in an array
     backup_array=($(ls -t "${backup}/backup_for_"*.zip))

     # deleting all the backups except the last 5 backups
     if [ ${#backup_array[@]} -gt 5 ]; then
	 echo "deleting the old backups and keeping only the last 5 backups..."
	 delete=("${backup_array[@]:5}")
        
	 for i in ${delete[@]}
	   do 
	      rm -f ${i}
	   done

	 if [ $? -ne 0 ]; then
            echo "Backup Management failed,exiting ..."
            exit 1
          else
            echo "Only the last 5 backups have been stored"
         fi
     fi

      
