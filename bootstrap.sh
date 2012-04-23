#!/bin/bash

# Warning: Don't forget the SSH keys first!

# Get the dotfiles directory (based on where this script is running from)
DOTDIR=$HOME/lib/dotfiles
if [ `pwd` != $DOTDIR ]; then
    echo "This must be run from $HOME/lib/dotfiles"
    exit 1;
fi

mkdir -p $HOME/lib

# Setup .vim
DOTVIM=$HOME/lib/dotvim
if [ ! -d $DOTVIM ]; then
    git clone git@github.com:dfm/.vim.git $DOTVIM
    (cd $DOTVIM; git submodule update --init)
    ln -Fs $DOTVIM $HOME/.vim
    ln -Fs $DOTVIM/vimrc $HOME/.vimrc
else
    echo "dotvim is already installed."
fi

# Setup oh-my-zsh
if [ ! -d $HOME/lib/oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/lib/oh-my-zsh
else
    echo "oh-my-zsh is already installed."
fi

# Setup z
if [ ! -d $HOME/lib/z ]; then
    git clone https://github.com/rupa/z.git $HOME/lib/z
else
    echo "z is already installed."
fi

# Links
ln -Fs $DOTDIR/.zshrc     $HOME/.zshrc
ln -Fs $DOTDIR/.gitconfig $HOME/.gitconfig
ln -Fs $DOTDIR/.screenrc  $HOME/.screenrc

