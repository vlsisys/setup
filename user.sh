#! /bin/bash
# [Bash Environment Setup]
cp .bash_aliases ~
cp .vimrc ~
mkdir -p ~/.vim
mkdir -p ~/project
cp -rf bundle ~/.vim/

source ~/.bashrc
