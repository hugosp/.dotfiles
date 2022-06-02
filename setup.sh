#!/bin/bash

### SYMLINKS
echo "* Adding Symlinks"
[[ -e  ~/.tmux.conf ]] || ln -sv ~/.dotfiles/tmux/.tmux.conf ~
[[ -e  ~/.vim ]] || ln -sv ~/.dotfiles/vim/ ~/.vim

[[ -e  ~/.zshrc ]] || ln -sv ~/.dotfiles/zsh/.zshrc ~

[[ -e  ~/.gitconfig ]] || ln -sv ~/.dotfiles/git/.gitconfig ~
[[ -e  ~/.gitignore_global ]] || ln -sv ~/.dotfiles/git/.gitignore_global ~

## ADD READ BASH-EXTRAS TO .bashrc
echo "* Adding alias and functions to bashrc"
cat ~/.bashrc | grep -qF 'source ~/.dotfiles/bash/.bash_profile' || echo 'source ~/.dotfiles/bash/.bash_profile' >> ~/.bashrc

## Add vundle to vim
echo "* Adding vundle to vim - Remember to run vundle install first time."
[[ -d ~/.dotfiles/vim/bundle/Vundle.vim ]] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/vim/bundle/Vundle.vim

echo "* Install global tools from npm"
npm i -g diff-so-fancy
sudo apt install bat
sudo apt install magic-wormhole

sudo add-apt-repository ppa:ultradvorka/ppa && sudo apt update && sudo apt install hstr
hstr --show-configuration >> ~/.bashrc && . ~/.bashrc
hstr --show-configuration >> ~/.zshrc && . ~/.zshrc
