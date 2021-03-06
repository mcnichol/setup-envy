#!/usr/bin/env bash

sudo apt-get -y update

##############
#SETUP DOCKER#
##############
sudo apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -

IS_VALID_DOCKER_GPG_SIG=$(apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D | grep Docker | wc -l)
if [ $IS_VALID_DOCKER_GPG_SIG -eq 1 ]; then #Setup Stable Docker Repository
    sudo add-apt-repository \
        "deb https://apt.dockerproject.org/repo/ \
        ubuntu-$(lsb_release -cs) \
        main"
    sudo apt-get -y install docker-engine=1.13.1-0~ubuntu-yakkety
else
    echo "Not a valid Docker Signature"
fi

#SETUP DOCKER-COMPOSE
#https://github.com/docker/compose/releases
sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.11.1/docker-compose-$(uname -s)-$(uname -m)"
sudo chmod 755 /usr/local/bin/docker-compose
echo "docker-compose success.  Version: \n$(docker-compose -v)"

MODULE_DIRECTORY="https://raw.githubusercontent.com/mcnichol/modules/master"
MODULE_CONFIG_DIRECTORY="$(pwd)/config"

#GIT AND SCM TOOLS
sh -c "$(curl -fsSL $MODULE_DIRECTORY/git/install.sh)"
#sh -c "../modules/git/install.sh"

#SSH SETUP
sh -c "$(curl -fsSL $MODULE_DIRECTORY/ssh/install.sh)"
#sh -c "../modules/ssh/install.sh"

#ZSH ENVIRONMENT SETUP
sh -c "$(curl -fsSL $MODULE_DIRECTORY/zsh/install.sh)"
#sh -c "../modules/zsh/install.sh"

#TMUX SETUP
TMUX_CONFIG_URL=$MODULE_CONFIG_DIRECTORY sh -c "$(curl -fsSL $MODULE_DIRECTORY/tmux/install.sh)"
#TMUX_CONFIG_URL=$MODULE_CONFIG_DIRECTORY sh -c "../modules/tmux/install.sh"

#VIM SETUP
VIM_CONFIG_URL=$MODULE_CONFIG_DIRECTORY sh -c "$(curl -fsSL $MODULE_DIRECTORY/vim/install.sh)"
#VIM_CONFIG_URL=$MODULE_CONFIG_DIRECTORY sh -c "../modules/vim/install.sh"

##JAVA SETUP
#sudo apt-get -y install openjdk-8-jdk
#git clone https://github.com/gcuisinier/jenv.git ~/.jenv
#echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
#echo 'eval "$(jenv init -)"' >> ~/.zshrc

