#!/bin/sh
sudo apt-get install clang-3.4 libclang-3.4-dev git-core python-pip && \
cd ~/
git clone https://github.com/tripples/.emacs.d.git ~/.emacs.d/
cd ~/.emacs.d/
git submodule init
git submodule update
sudo pip install -r requirements.txt && \
cd ~/.emacs.d/src/clang/ && \
make LLVM_CONFIG=llvm-config-3.4
