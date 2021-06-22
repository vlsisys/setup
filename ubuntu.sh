#! /bin/bash
# ==================================================
#  Coded by Woong
# ==================================================
# [Update & Upgrade]
sudo apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y full-upgrade

sudo apt-get -y install build-essential
sudo apt-get -y install samba openssh-server
sudo apt-get -y install vim-gtk3
sudo apt-get -y install x11-apps dbus-x11
sudo apt-get -y install gnome-terminal
sudo apt-get -y install tcl-dev tk-dev python3-dev python3-pip python3-tk
sudo apt-get -y install cmake clang ctags

# [Python]
sudo pip3 install --upgrade pip launchpadlib setuptools
sudo pip3 install numpy pandas scipy matplotlib pillow pypi progress idx2numpy xlrd
sudo pip3 install jupyter jupyterlab

# [Bash Environment Setup]
cp .bash_aliases ~
cp .vimrc ~
mkdir -p ~/.vim
mkdir -p ~/project
cp -rf bundle ~/.vim/

source ~/.bashrc

# [Ubuntu Driver Install]
sudo ubuntu-drivers autoinstall

#sudo reboot
