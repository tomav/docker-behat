docker-behat
============

This repository is the source of `tvial/behat` which brings :  
- a basic shell with oh-my-zsh  
- php5-cli  
- behat  
- all needed dependencies  

## Install

    docker pull tvial/behat

## Usage

    docker run -t -i -h docker-behat -v $(pwd):/home/behat/data:rw tvial/behat /bin/zsh

or add to your environnement:  

    alias docker-behat='docker run -t -i -h docker-behat -v $(pwd):/home/behat/data:rw tvial/behat /bin/zsh'

You should see a prompt containing `[ docker-behat ]` and have `behat` command available.  
A `data` folder is mouted read/write to your current folder (the one you launched docker-behat).  

## Build

If you need adapt the project to your needs, clone, modify the `Dockerfile` and from the source directory, run :

    docker build -t behat/tvial .

