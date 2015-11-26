#!/bin/bash


cd ~

# Detect platform
if [[ "$OSTYPE" == "darwin"* ]]; then
    os=osx
elif [[ "$OSTYPE" == "linux"* ]]; then
    os=linux
else
    echo "Could not detect operating system."
    exit 1
fi

# Make sure we have the "home" repo
if [[ -d home ]]; then
    cd home
    git pull origin master
else
    git clone git@github.com:josephtyler/home.git home
fi

# Make the sym links
ln -s ~/home/bin ~/bin
ln -s ~/home/src ~/src
ln -s ~/home/.vim ~/.vim
ln -s ~/home/.vimrc ~/.vimrc
ln -s ~/home/.zshrc ~/.zshrc
