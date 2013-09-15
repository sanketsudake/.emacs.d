#!/bin/sh
sudo apt-get install clang libclang-dev git-core&& \
cd ~/
git clone https://github.com/tripples/.emacs.d.git ~/.emacs.d/
cd ~/.emacs.d/
git submodule init
git submodule update
sudo pip install -r requirements.txt && \
cd ~/.emacs.d/src/clang/ && \
make
