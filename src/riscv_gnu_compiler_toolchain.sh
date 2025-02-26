#! /bin/bash

# --------------------------------------------------
# [Basic Packages]
# --------------------------------------------------
echo '=============================='
echo ' Install RISC-V GNU Compiler'
echo '=============================='
mkdir -p ~/temp
cd ~/temp/
git clone https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
./configure --prefix=$HOME/tools/riscv --enable-multilib
make linux
