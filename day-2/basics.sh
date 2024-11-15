#!/bin/bash

   # creating variables and implementing them 
	name="Arijit"
	echo "My name is $name" 
	echo "today's date is : $(date)"

	echo "enter your name:"
	read username	
	echo "welcome to the project $username"

    # displaying data using arguments

	echo "the project name is $0 and the owner is $1"

    # checking if a number is odd or even with conditionals
    	
       number=77

       if (( $number >= 0 && $number<=50 ))
	  then echo "small"

       elif (($number >50 &&$number<=85))
	   then echo "medium"

       else echo "odd"

	fi


     # printing the tables for any number using for loop
	echo "enter a number:"
	read first

	for((num=1;num<=10;num++))
	  do 
		  product=$((num * first))
		  echo "$num X $first = $product"

	  done 

     # checking if a number is prime or not using while loop
     	echo "enter the number:"
	read check
	divider=2
	is_prime=1
	while [[ $divider -lt $check ]]
	  do
	     if (( check % divider ==0 ))
		then
		  echo "not a prime number"
		  is_prime=0
		  break
	      fi

	      (( divider++ ))
	 done

	  if (( is_prime == 1 ))
	    then
		echo "prime number"
	  fi






