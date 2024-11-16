#!/bin/bash

   # handling an error with if-then

   make_folder(){
	mkdir demo
	}

	if make_folder ;then
	   echo "the folder is created successfully"

	 else
	   echo " the folder already exists"
           exit 1
	fi




