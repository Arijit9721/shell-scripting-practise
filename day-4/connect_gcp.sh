#!/bin/bash
set -euo pipefail

    # essential variables
    	name="test-vm"
	zone="us-central1-a"
	machine="e2-micro"
	project="inspired-photon-441609-k7"
	email="vm-creater-account@inspired-photon-441609-k7.iam.gserviceaccount.com"
	key_location="$HOME/service-key1.json"
	gcloud_location="./"

    # function for downloading and installing the gcloud CLI

    cli_tool(){
    
    # if the file is not downloaded,download it from the link 
        if [ ! -f "$gcloud_location/google-cloud-cli-linux-x86_64.tar.gz" ];  then  
          echo " cli being downloaded"
	  curl -o "google-cloud-cli-linux-x86_64.tar.gz" https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz	 
       else
          echo "gcloud already downloaded,starting to setup..."
       fi
       
    # setting up the CLI
    	if ! command -v gcloud &> /dev/null; then 
          tar -xf "./google-cloud-cli-linux-x86_64.tar.gz" 
          ./google-cloud-sdk/install.sh

          if [ $? -ne 0 ]; then
    	     echo "Installation failed!! Exiting..."
    	     exit 1
	  else
	     echo "the installation is complete"
	  fi
	fi

    # check if the setup is done properly
       gcloud version	
    }

    # function to connect to the gcloud with a service account for non-interactive login
    connect_account(){
    	gcloud auth activate-service-account --key-file="${key_location}"

	# checking if  the connection is successfull or not
	gcloud auth list

	# set the service account
        gcloud config set account "$email"
          if [ $? -ne 0 ]; then
                  echo " error while setting the account , exiting ..."
                  exit 1
              fi
    }

    # set the project as default(need to press Y to continue)
   	set_account(){
          gcloud config set project $project
	    if [ $? -ne 0 ]; then
                  echo " error while setting the project , exiting ..."
                  exit 2
              fi

	  gcloud config get project
	}

    # function to create a vm from cli input
	create_vm() {
	  #enabling the api
	  gcloud services enable compute.googleapis.com

	  #check if the vm already exists and if not create the vm
	  exists=$(gcloud compute instances list --filter="name=${name}" --format="value(name)")

	  if [ -z "$exists" ]; then 
	      echo " creating vm"
	      gcloud compute instances create ${name} \
  		--zone=${zone} \
  		--machine-type=${machine}\
  		--image-project="debian-cloud" \
  		--image-family="debian-11" \
 	        --network="default"
 		
	# cheking if the vm is getting created or there is an error
	      if [ $? -ne 0 ]; then
		  echo " error while creating the vm, exiting ..."
		  exit 1
	      fi

	  else
	      echo "the vm ${name} already exists"
	      exit 1
	  fi

	}	

    # setting up the gcloud CLI
    if ! cli_tool; then
	   echo " error preparing CLI"
	   exit 1 
    else
	 echo "gcloud CLI - now ready for use!!" 
    fi

     # connecting to the service account
    if ! connect_account; then
           echo " error while connecting to the service account"
           exit 1
    else
         echo "connection to the service account successfull"
    fi

    # setting the service account as the usable account
      if ! set_account; then
	      echo " failure to set the account"
	      exit 1

      else 
	      echo " the service account is now being used"

      fi

     # creating the vm from given input details
        if ! create_vm; then
              echo " failure to create the vm"
              exit 1

      else
              echo " the vm was created successfully"

      fi
