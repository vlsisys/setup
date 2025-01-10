#! /bin/bash
echo '=============================='
echo ' Config. Bash Environment'
echo '=============================='
# --------------------------------------------------
# [Bash Environment Setup]
# --------------------------------------------------
ln -s 		./utils				~/utils				
ln -s 		./templates			~/templates			
ln -s 		./.vim				~/.vim				
ln -s  		./.bash_aliases		~/.bash_aliases		
ln -s  		./.vimrc			~/.vimrc			

sudo	cp -rf 		./fonts/Sudo			/usr/share/fonts/truetype/
sudo	cp -rf 		./fonts/VictorMono		/usr/share/fonts/truetype/
sudo	cp -rf 		./fonts/JetBrainsMono	/usr/share/fonts/truetype/

mkdir -p	~/projects ~/temp
