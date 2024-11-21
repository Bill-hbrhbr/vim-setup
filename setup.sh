#!/bin/bash

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    vim \
    tmux \
    wget

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

# java
mkdir -p ~/.local
cd ~/.local
wget https://download.oracle.com/java/23/latest/jdk-23_linux-x64_bin.tar.gz
rm -rf jdk-23 && mkdir jdk-23
tar xzf jdk-23_linux-x64_bin.tar.gz -C jdk-23 --strip-components 1
rm jdk-23_linux-x64_bin.tar.gz

echo "" >> ~/.bashrc
echo "export JAVA_HOME=~/.local/jdk-23" >> ~/.bashrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc

# task
mkdir -p ~/.local/bin
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d v3.36.0
echo "export PATH=~/.local/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc

