
# Makefile for handling Docker Commands

.PHONY: build up down

# creating a variable to store a command
DC := docker-compose

# making a function to find the name of he OS
OS := $(shell uname)

# creating a target to run docker build only on Linux 
build:
ifeq ($(OS), Linux)
	@echo "Running in linux"
	$(DC) build
else 
        @echo "Unable to build the file"
endif

# other neccessary targets 
up: 
	$(DC) up -d

down:
	$(DC) down

clean:
	docker system prune 
