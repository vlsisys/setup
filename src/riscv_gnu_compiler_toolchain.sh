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
mkdir -p build; cd build
../configure --prefix=$HOME/utils/riscv --enable-multilib
make
