#! /bin/bash
# ==================================================
#  Coded by Woong
# ==================================================
# [Update & Upgrade]
sudo apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y full-upgrade

sudo apt-get -y install xserver-xorg-input-all
sudo apt-get -y build-essential
sudo apt-get -y vim-gtk3

cp .bash_aliases ~
cp .vimrc
cp -rf bundle/ ~/.vim/

sudo ubuntu-drivers autoinstall
sudo reboot


