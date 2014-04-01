docker-behat
============

This repository is the source of `tvial/behat` which brings :  
- a basic shell with oh-my-zsh  
- php5-cli  
- behat 2.5 / mink 1.5  
- all needed dependencies  

## Install

    docker pull tvial/behat

## Usage

    docker run -t -i -h docker-behat -v $(pwd):/home/behat/data:rw tvial/behat /bin/zsh  

You should see a prompt containing `[ docker-behat ]` and have `behat` command available.  
A `data` folder is mounted read/write to your current folder (the one you launched docker-behat).  

Or, on your host, you can add the `behat()` function to your shell environnement:  

    function behat() { docker run -t -i -h docker-behat -v $(pwd):/home/behat/data:rw tvial/behat /bin/zsh -c "behat $*" ;}

You can now call `behat` command from your host, it will be executed in your docker container.

## Build

If you need adapt the project to your needs, clone, modify the `Dockerfile` and from the source directory, run :

    docker build -t behat/tvial .

