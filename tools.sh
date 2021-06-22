#! /bin/bash
# ==================================================
#  Coded by Woong
# ==================================================

# [cuda]
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt-get update
sudo apt-get -y install cuda

# [TensorFlow]
sudo pip3 install tensorflow

# [Pytorch: should be checked official guideline depending on cudaDNN and OS version]
sudo pip3 install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html

# [Samba]
mkdir -p /vlsisys-samba
chmod 777 /vlsisys-samba
sudo ufw allow samba

