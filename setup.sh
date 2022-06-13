#!/bin/bash

echo "* Installing dependecies"
sudo apt install zsh
sudo apt install stow
sudo apt install hstr

echo "* ZSH as default shell"
chsh -s $(which zsh)

echo "* Bundle zsh_plugins"
~/.dotfiles/bin/antibody bundle < ~/.dotfiles/zsh/.zsh_plugins.txt > ~/.zsh_plugins.sh

echo "* Adding Symlinks"
stow tmux 
stow vim
stow zsh
stow git 

echo "* Adding alias and functions to bashrc"
cat ~/.bashrc | grep -qF 'source ~/.dotfiles/bash/.bash_profile' || echo 'source ~/.dotfiles/bash/.bash_profile' >> ~/.bashrc

echo "* Adding vundle to vim - Remember to run vundle install first time."
[[ -d ~/.dotfiles/vim/.vim/bundle/Vundle.vim ]] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/vim/.vim/bundle/Vundle.vim
