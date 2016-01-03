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
    git clone --recursive git@github.com:josephtyler/home.git home
    git submodule update .vim/bundle/ctrlp.vim
    git submodule update .vim/bundle/nerdtree
    git submodule update .vim/bundle/vim-buffergator
fi

# Removing existing files, directories and symlinks
if [[ -d ~/bin ]]; then
    rm -rf ~/bin
fi

if [[ -d ~/src ]]; then
    rm -rf ~/src
fi

if [[ -d ~/.vim ]]; then
    rm -rf ~/.vim
fi

if [[ -f ~/.vimrc ]]; then
    rm ~/.vimrc
fi

if [[ -f ~/.zshrc ]]; then
    rm ~/.zshrc
fi

# Make the sym links
ln -s ~/home/bin ~/bin
ln -s ~/home/src ~/src
ln -s ~/home/.vim ~/.vim
ln -s ~/home/.vimrc ~/.vimrc
ln -s ~/home/.zshrc ~/.zshrc
