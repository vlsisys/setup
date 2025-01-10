#! /bin/bash

# --------------------------------------------------
# [Building gem5]
# --------------------------------------------------
echo '=============================='
echo ' Requirements for gem5'
echo '=============================='
sudo apt-get -y install build-essential git m4 scons zlib1g zlib1g-dev libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev python3-dev python3
sudo apt-get -y install libboost-all-dev


# --------------------------------------------------
# [Getting the code]
# --------------------------------------------------
echo '=============================='
echo ' Getting the code'
echo '=============================='
mkdir -p ~/projects && cd ~/projects/
git clone https://github.com/gem5/gem5

# --------------------------------------------------
# [Python Virtual Environment]
# --------------------------------------------------
echo '=============================='
echo ' Python Virtual Environment'
echo '=============================='
mkdir -p ~/venv && cd ~/venv/
python3 -m venv gem5
