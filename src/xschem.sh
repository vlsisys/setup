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
sudo make install

# --------------------------------------------------
# [Magic: Layout Editor Install]
# --------------------------------------------------
#git clone git://opencircuitdesign.com/magic
sudo apt-get -y install magic

# --------------------------------------------------
# Installing Open_PDKs version 1.0 for Google/SkyWater
# --------------------------------------------------
git clone git://opencircuitdesign.com/open_pdks ~/tools/open_pdks
cd ~/tools/open_pdks
./configure --enable-sky130-pdk --enable-sram-sky130
make
sudo make install
#make veryclean

echo 'source /usr/local/share/pdk/sky130B/libs.tech/xschem/xschemrc' > ~/.xschem/xschemrc
