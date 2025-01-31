#! /bin/bash

# --------------------------------------------------
# [Building gem5]
# --------------------------------------------------
echo '=============================='
echo ' Requirements for gem5'
echo '=============================='
sudo apt install build-essential scons python3-dev git pre-commit zlib1g zlib1g-dev \
    libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \
    libboost-all-dev  libhdf5-serial-dev python3-pydot python3-venv python3-tk mypy \
    m4 libcapstone-dev libpng-dev libelf-dev pkg-config wget cmake doxygen

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
python3 -m venv ~/.venv/gem5
