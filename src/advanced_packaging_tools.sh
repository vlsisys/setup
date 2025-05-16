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
sudo apt-get -y install gawk tcl-dev tk-dev python3 python3-dev python3-pip python3-tk python3-git python3-tomli python3-venv
sudo apt-get -y install cmake clang universal-ctags
sudo apt-get -y install autoconf automake autotools-dev curl ninja-build git gdb
sudo apt-get -y install bison flex texinfo gperf libtool patchutils bc zlib1g-dev
sudo apt-get -y install libmpc-dev libmpfr-dev libgmp-dev libexpat-dev libglib2.0-dev libslirp-dev libusb-1.0-0-dev device-tree-compiler pkg-config
sudo apt-get -y install yosys gv
sudo apt-get -y install tmux

# --------------------------------------------------
# [Verilog Dev. Environment]
# --------------------------------------------------
echo '=============================='
echo ' Install Verilog Dev. Env.'
echo '=============================='
sudo apt-get -y install iverilog
sudo apt-get -y install gtkwave
sudo apt-get -y install verilator
