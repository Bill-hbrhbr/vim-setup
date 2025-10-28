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
JDK_VERSION=25

mkdir -p ~/.local
cd ~/.local

wget "https://download.oracle.com/java/${JDK_VERSION}/archive/jdk-${JDK_VERSION}_linux-x64_bin.tar.gz"
rm -rf "jdk-${JDK_VERSION}" && mkdir "jdk-${JDK_VERSION}"
tar xzf "jdk-${JDK_VERSION}_linux-x64_bin.tar.gz" -C "jdk-${JDK_VERSION}" --strip-components 1
rm "jdk-${JDK_VERSION}_linux-x64_bin.tar.gz"

{
  echo ""
  echo "export JAVA_HOME=\$HOME/.local/jdk-${JDK_VERSION}"
  echo "export PATH=\$JAVA_HOME/bin:\$PATH"
} >> ~/.bashrc
source ~/.bashrc

# task
mkdir -p ~/.local/bin
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d v3.44.0
echo "export PATH=~/.local/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc

