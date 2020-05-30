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

# Submodules, vim extensions
if [[ -d .vim/bundle/nerdtree ]]; then
    git submodule update --init .vim/bundle/nerdtree
else
    git submodule add git@github.com:scrooloose/nerdtree.git .vim/bundle/nerdtree
fi

if [[ -d .vim/bundle/vim-buffergator ]]; then
    git submodule update --init .vim/bundle/vim-buffergator
else
    git submodule add git@github.com:jeetsukumaran/vim-buffergator.git .vim/bundle/vim-buffergator
fi

if [[ -d .vim/bundle/jshint2 ]]; then
    git submodule update --init .vim/bundle/jshint2
else
    git submodule add git@github.com:Shutnik/jshint2.vim.git .vim/bundle/jshint2
fi

if [[ -d .vim/bundle/syntastic ]]; then
    git submodule update --init .vim/bundle/syntastic
else
    git submodule add git@github.com:scrooloose/syntastic.git .vim/bundle/syntastic
fi

if [[ -d .vim/bundle/solarized ]]; then
    git submodule update --init .vim/bundle/solarized
else
    git submodule add git://github.com/altercation/vim-colors-solarized.git .vim/bundle/solarized
fi

if [[ -d .vim/bundle/pydocstring ]]; then
    git submodule update --init .vim/bundle/pydocstring
else
    git submodule add git@github.com:heavenshell/vim-pydocstring.git .vim/bundle/pydocstring
fi

if [[ -d .vim/bundle/SimpylFold ]]; then
    git submodule update --init .vim/bundle/SimpylFold
else
    git submodule add git@github.com:tmhedberg/SimpylFold.git .vim/bundle/SimpylFold
fi

if [[ -d .vim/bundle/FastFold ]]; then
    git submodule update --init .vim/bundle/FastFold
else
    git submodule add git@github.com:Konfekt/FastFold.git .vim/bundle/FastFold

fi

if [[ -d .vim/bundle/dracula-theme ]]; then
    git submodule update --init .vim/bundle/dracula-theme
else
    git submodule add git@github.com:dracula/vim.git .vim/bundle/dracula-theme
fi

if [[ -d .vim/bundle/flake8 ]]; then
    git submodule update --init .vim/bundle/flake8
else
    git submodule add https://github.com/nvie/vim-flake8 .vim/bundle/flake8
fi

if [[ -d .vim/bundle/fzf.vim ]]; then
    git submodule update --init .vim/bundle/fzf.vim
else
    git submodule add git@github.com:junegunn/fzf.vim.git .vim/bundle/fzf.vim
fi

if [[ -d .vim/bundle/vim-jsx ]]; then
    git submodule update --init .vim/bundle/vim-jsx
else
    git submodule add git@github.com:mxw/vim-jsx.git .vim/bundle/vim-jsx
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

if [[ -f ~/.git-completion ]]; then
    rm ~/.git-completion
fi

# Make the sym links
ln -s ~/home/bin ~/bin
ln -s ~/home/src ~/src
ln -s ~/home/.vim ~/.vim
ln -s ~/home/.vimrc ~/.vimrc
ln -s ~/home/.zshrc ~/.zshrc
ln -s ~/home/.git-completion ~/.git-completion
