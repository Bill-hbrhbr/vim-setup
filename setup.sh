#!/bin/bash

rm -f ~/.vimrc
rm -rf ~/.vim
rm -f ~/.tmux.conf
rm -f ~/.gitconfig
rm -f ~/.gitignore

git submodule update --init --recursive
cp .vimrc ~/
cp -r .vim ~/
cp .tmux.conf ~/
tmux source ~/.tmux.conf
cp .gitconfig ~/
cp .gitignore ~/
