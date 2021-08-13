#! /bin/bash
# ==================================================
#  Coded by Woong
# ==================================================

if [ `whoami` == "root" ]; then
	# ----------------------------------------------
	# [cuda]
	# ----------------------------------------------
	if [[ $(lsb_release -rs) == "20.04" ]]; then
		echo "======================================================================"
		echo " Cuda Install for Ubuntu 20.04"
		echo "======================================================================"
		wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
		sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
		sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
		sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
		sudo apt-get update
		sudo apt-get -y install cuda
	elif [[ $(lsb_release -rs) == "18.04" ]]; then
		echo "======================================================================"
		echo " Cuda Install for Ubuntu 18.04"
		echo "======================================================================"
		wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
		sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
		sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
		sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
		sudo apt-get update
		sudo apt-get -y install cuda
	else
		echo "======================================================================\n"
		echo " Current Ubunutu can't support cuda install!!!\n"
		echo "======================================================================\n"
	fi

	# ----------------------------------------------
	# [TensorFlow]
	# ----------------------------------------------
	sudo pip3 install tensorflow
	
	# ----------------------------------------------
	# [Pytorch: should be checked official guideline depending on cudaDNN and OS version]
	# ----------------------------------------------
	sudo pip3 install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html
	
else
	echo "======================================================================\n"
	echo " This script is permitted for root!!!\n"
	echo "======================================================================\n"
fi
