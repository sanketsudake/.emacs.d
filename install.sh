#!/bin/sh

if [ -d "/home/$USER/.emacs.d/" ]
then
	echo "~/.emacs.d/ Already exist"
	echo -n "Do you want to remove existing ? (y/n) => "
	read rep
	if [ $rep = 'y' ]
	then
		echo "Removing previous emacs configuration."
		rm -rf ~/.emacs.d/
	else
		echo "Exiting installation."
		exit 1
	fi
fi

echo "Enter password to install packages."
APPS="clang-3.4 libclang-3.4-dev git-core python-pip"
sudo apt-get -y install $APPS

cd ~/
git clone https://github.com/tripples/.emacs.d.git ~/.emacs.d/
cd ~/.emacs.d/
git submodule init
git submodule update
sudo pip install -r requirements.txt
cd ~/.emacs.d/src/clang/
make LLVM_CONFIG=llvm-config-3.4
