#!/bin/bash

  #creating a function that checks if a number is odd or even
  function check_odd(){
    
    if (($1 % 2 == 0));then
         echo "the number is even"
    else
	 echo "the number is odd"
    fi
  }

  echo "enter a number:"
  read number
  check_odd "$number"
