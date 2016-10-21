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
fi

git submodule update --init .vim/bundle/ctrlp.vim
git submodule update --init .vim/bundle/nerdtree
git submodule update --init .vim/bundle/vim-buffergator
git submodule update --init .vim/bundle/jshint2

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

if [[ -f ~/.bashrc ]]; then
    rm ~/.bashrc
fi

if [[ -f ~/.tmux.conf ]]; then
    rm ~/.tmux.conf
fi

# Make the sym links
ln -s ~/home/bin ~/bin
ln -s ~/home/src ~/src
ln -s ~/home/.vim ~/.vim
ln -s ~/home/.vimrc ~/.vimrc
ln -s ~/home/.bashrc ~/.bashrc
ln -s ~/home/.tmux.conf ~/.tmux.conf
