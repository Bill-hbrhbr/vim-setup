#!/bin/bash

rm -f ~/.vimrc
rm -rf ~/.vim
git submodule update --init --recursive
cp .vimrc ~/
cp -r .vim ~/
cp .tmux.conf ~/
tmux source ~/.tmux.conf

