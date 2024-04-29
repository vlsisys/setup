#!/bin/bash
# ----------------------------------------------
# [Prerequisites]
# ----------------------------------------------
#sudo apt-get -y install verilator
#sudo apt-get -y install git help2man perl python3 make autoconf g++ flex bison ccache
#sudo apt-get -y install libgoogle-perftools-dev numactl perl-doc
#sudo apt-get -y install libfl2
#sudo apt-get -y install libfl-dev
#sudo apt-get -y install zlibc zlib1g zlib1g-dev
#sudo apt-get -y install ccache
#sudo apt-get -y install mold
#sudo apt-get -y install libgoogle-perftools-dev numactl
#sudo apt-get -y install perl-doc

# ----------------------------------------------
# [SystemC]
# ----------------------------------------------
#cd ~/utils
#wget https://github.com/accellera-official/systemc/archive/refs/tags/3.0.0.tar.gz
#tar -zxvf 3.0.0.tar.gz

# ----------------------------------------------
# [Verilator]
# ----------------------------------------------
cd ~/utils
git clone https://github.com/verilator/verilator
unset VERILATOR_ROOT
cd verilator

autoconf         		# Create ./configure script
./configure      		# Configure and create Makefile
make					# Build Verilator itself (if error, try just 'make')
sudo make install
