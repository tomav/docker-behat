# docker-behat

[![Build Status](https://travis-ci.org/tomav/docker-behat.svg?branch=master)](https://travis-ci.org/tomav/docker-behat) 

This repository is the source of `tvial/behat` which brings:  
- a basic shell with oh-my-zsh  
- php5-cli with PHP 5.5  
- behat 3.0 / mink 1.5  
- all needed dependencies  

## Install

    docker pull tvial/behat

## Usage

	docker run -ti -h docker-behat -v "$(pwd)/project":/root/project tvial/behat zsh

You should see a prompt containing `[ docker-behat ]` and have `behat` command available.  

## Build

If you need adapt the project to your needs, clone, modify the `Dockerfile` and from the source directory, run:

    docker build -t tvial/behat .

Also available via [Docker Index](https://index.docker.io/u/tvial/behat/).
