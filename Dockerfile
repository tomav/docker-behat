FROM ubuntu:12.04
MAINTAINER Thomas VIAL

# Update and install packages
ADD sources.list /etc/apt/sources.list
RUN apt-get update
# RUN apt-get upgrade -y
RUN apt-get -y install curl php5-cli php5-curl zsh git vim 

# Create "behat" user with password crypted "behat"
RUN useradd -d /home/behat -m -s /bin/zsh behat
RUN echo "behat:behat" | chpasswd

# Set "zsh" as default shell
# RUN chsh -s /bin/zsh behat

# Add "behat" to "sudoers"
RUN echo "behat        ALL=(ALL:ALL) ALL" >> /etc/sudoers

USER behat
WORKDIR /home/behat
ENV HOME /home/behat
ENV PATH $PATH:/home/behat

# Behat alias in docker container
ADD behat /home/behat/behat
RUN chmod +x /home/behat/behat

# Clone oh-my-zsh
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git /home/behat/.oh-my-zsh/

# Create a new zsh configuration from the provided template
ADD .zshrc /home/behat/.zshrc

# Install Behat
RUN mkdir /home/behat/composer
ADD composer.json /home/behat/composer/composer.json
RUN cd /home/behat/composer && curl http://getcomposer.org/installer | php
RUN cd /home/behat/composer && php composer.phar install --prefer-source