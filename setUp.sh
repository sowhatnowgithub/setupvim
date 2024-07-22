
#!/bin/bash

#install neovim 
echo " Please select your device 0.For mac 1.for linux"
read input
if [[ $input == "0" ]]; then
    arch -arm64 brew install neovim #if u are on old intel replace arm with arch64
else 
    sudo apt-get install neovim
fi
#the following is the setup for the neovim
# packer is the package manager tool we will be using
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mkdir -p  ~/.config/nvim
touch ~/.config/nvim/init.lua

mv init.lua ~/.config/nvim/init.lua


echo "want to install go, 0 to skip, press any to install "
read go
if [[ $go != "0" ]]; then
	if [[ $input == "1" ]]; then
		sudo apt install golang
	else
		arch -arm64 brew install go # replace the -arm with arch64 for intel mac
  	fi
fi 

go install golang.org/x/tools/gopls@latest

echo "want to install ripgrep , 0 to skip and press any to install "
read ripgrep

if [[ $ripgrep != "0" ]]; then
	if [[ $input == "0" ]]; then
		arch -arm64 brew install ripgrep
	else 
		sudo apt install ripgrep
	fi 
fi 

echo "End has been reached read the further procedure for complete setup in the README.md "
cat README.md


