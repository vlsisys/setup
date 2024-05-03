#! /bin/bash
echo '=============================='
echo ' Config. Bash Environment'
echo '=============================='
# --------------------------------------------------
# [Bash Environment Setup]
# --------------------------------------------------
cp -rf 		./utils				~	
cp -rf 		./.bash_aliases		~	
cp -rf 		./.vimrc			~	
cp -rf 		./.vim				~	

sudo	cp -rf 		./fonts/Sudo			/usr/share/fonts/truetype/
sudo	cp -rf 		./fonts/VictorMono		/usr/share/fonts/truetype/
sudo	cp -rf 		./fonts/JetBrainsMono	/usr/share/fonts/truetype/

mkdir -p	~/projects
