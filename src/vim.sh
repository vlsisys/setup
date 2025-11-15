#! /bin/bash

# --------------------------------------------------
# [Vim Latest]
# --------------------------------------------------
echo '=============================='
echo ' Install Vim Latest'
echo '=============================='
mkdir -p ~/temp
cd	~/temp
git clone https://github.com/vim/vim.git
cd	vim/src
make
sudo make install

# --------------------------------------------------
# [fzf]
# --------------------------------------------------
echo '=============================='
echo ' Install fzf'
echo '=============================='
sudo apt-get -y install bat

mkdir -p ~/temp
cd	~/temp
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
