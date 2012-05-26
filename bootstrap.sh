#!/bin/bash

# Warning: Don't forget the SSH keys first!

# Get the dotfiles directory (based on where this script is running from)
DOTDIR=$HOME/lib/dotfiles
if [ `pwd` != $DOTDIR ]; then
    echo "This must be run from $HOME/lib/dotfiles"
    exit 1;
fi

# Setup .vim
DOTVIM=$HOME/lib/dotvim
if [ ! -d $DOTVIM ]; then
    git clone git@github.com:dfm/.vim.git $DOTVIM
    (cd $DOTVIM; git submodule update --init)
    ln -Ffs $DOTVIM $HOME/.vim
    ln -Ffs $DOTVIM/vimrc $HOME/.vimrc
else
    echo "dotvim is already installed."
fi

# Setup z
if [ ! -d $HOME/lib/z ]; then
    git clone https://github.com/rupa/z.git $HOME/lib/z
else
    echo "z is already installed."
fi

# Links
ln -Ffs $DOTDIR/zshrc     $HOME/.zshrc
ln -Ffs $DOTDIR/gitconfig $HOME/.gitconfig
ln -Ffs $DOTDIR/screenrc  $HOME/.screenrc

# Matplotlib
mkdir -p $HOME/.matplotlib
ln -Ffs $DOTDIR/matplotlibrc  $HOME/.matplotlib/matplotlibrc
