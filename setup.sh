#!/bin/bash

rm -f ~/.vimrc
rm -rf ~/.vim
rm -f ~/.tmux.conf
rm -f ~/.gitconfig
rm -f ~/.gitignore
rm -rf ~/myjdk

git submodule update --init --recursive
cp .vimrc ~/
cp -r .vim ~/
cp .tmux.conf ~/
tmux source ~/.tmux.conf
cp .gitconfig ~/
cp .gitignore ~/

cd ~ && mkdir myjdk && cd myjdk
wget jdk-23_linux-x64_bin.tar.gz
mkdir jdk-23
tar xzf jdk-23_linux-x64_bin.tar.gz -C jdk-23 --strip-components 1

echo "" >> ~/.bashrc
echo "export JAVA_HOME=~/jdk/jdk-23" >> ~/.bashrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc

