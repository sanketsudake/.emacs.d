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

#
# Install required apps
#
echo "Enter password to install packages."
APPS="clang git-core"
sudo apt-get -y install $APPS

#
# Clone repository
#
echo "Loading emacs configuration."
cd ~/
git clone https://github.com/tripples/.emacs.d.git ~/.emacs.d/
echo "Done. Few steps ahead... "
cd ~/.emacs.d/

cask init
cask update
echo "Start emacs now."
