#!/usr/bin/env bash

apt-get -y install git
git config --global user.name "McNichol"
git config --global user.email mcnichol.m@gmail.com

apt-get -y install tmux
mv tmux.conf ~/.tmux.conf

apt-get -y install vim
mv vimrc ~/.vimrc

apt-get -y install zsh
mv zshrc ~/.zshrc


