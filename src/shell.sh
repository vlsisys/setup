#! /bin/bash
echo '=============================='
echo ' Config. Bash Environment'
echo '=============================='
# --------------------------------------------------
# [Bash Environment Setup]
# --------------------------------------------------
cp -rf 		./utils				~/utils				
cp -rf 		./templates			~/templates			
cp -rf 		./.vim				~/.vim				
cp -rf  	./.bash_aliases		~/.bash_aliases		
cp -rf  	./.vimrc			~/.vimrc			

sudo	cp -rf 		./fonts/Sudo			/usr/share/fonts/truetype/
sudo	cp -rf 		./fonts/VictorMono		/usr/share/fonts/truetype/
sudo	cp -rf 		./fonts/JetBrainsMono	/usr/share/fonts/truetype/

mkdir -p	~/projects ~/temp
