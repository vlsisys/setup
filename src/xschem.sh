# --------------------------------------------------
# [Xschem: Required Packages]
# --------------------------------------------------
sudo apt-get -y  install libx11-dev
sudo apt-get -y  install libxrender-dev
sudo apt-get -y  install libx11-xcb-dev        
sudo apt-get -y  install libcairo2-dev
sudo apt-get -y  install tcl8.6-dev
sudo apt-get -y  install tk8.6-dev
sudo apt-get -y  install bison
sudo apt-get -y  install libxpm-dev
sudo apt-get -y  install libjpeg-dev

# --------------------------------------------------
# [Xschem: GitHub Cloning]
# --------------------------------------------------
git clone https://github.com/StefanSchippers/xschem.git ~/tools/xschem-src
cd ~/tools/xschem-src; ./configure
