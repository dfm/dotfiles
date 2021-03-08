#!/bin/bash

DOTDIR=$(pwd)
ln -Ffs $DOTDIR/gitconfig $HOME/.gitconfig
ln -Ffs $DOTDIR/gitignore_global $HOME/.gitignore_global
ln -Ffs $DOTDIR/tmux.conf  $HOME/.tmux.conf
