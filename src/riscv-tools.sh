#! /bin/bash

# --------------------------------------------------
# [Basic Packages]
# --------------------------------------------------
echo '=============================='
echo ' Install RISC-V Tools'
echo '=============================='
mkdir -p ~/temp; cd ~/temp/
git clone https://github.com/ucb-bar/riscv-tools 
cd riscv-tools
git submodule update --init --recursive
export RISCV=$HOME/utils/riscv/toolchain
export PATH=$PATH:$RISCV/bin
./build.sh 
