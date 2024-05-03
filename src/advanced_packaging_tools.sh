#! /bin/bash

# --------------------------------------------------
# [Basic Packages]
# --------------------------------------------------
echo '=============================='
echo ' Install Ubuntu Packages'
echo '=============================='
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install build-essential
sudo apt-get -y install vim-gtk3
sudo apt-get -y install x11-apps x11-server-utils dbus-x11
sudo apt-get -y install gnome-terminal
sudo apt-get -y install tcl-dev tk-dev python3-dev python3-pip python3-tk python3-git
sudo apt-get -y install cmake clang ctags

# --------------------------------------------------
# [Verilog Dev. Environment]
# --------------------------------------------------
echo '=============================='
echo ' Install Verilog Dev. Env.'
echo '=============================='
sudo apt-get -y install iverilog
sudo apt-get -y install gtkwave
