#!/bin/bash

echo "* Installing dependecies"
sudo apt install zsh
sudo apt install stow
sudo apt install hstr

echo "* installing antibody "
rm -f ~/.dotfiles/bin/antibody
curl -sfL git.io/antibody | sh -s - -b ~/.dotfiles/bin/

echo "* ZSH as default shell"
chsh -s $(which zsh)

echo "* Bundle zsh_plugins"
~/.dotfiles/bin/antibody bundle < ~/.dotfiles/zsh/.zsh_plugins.txt > ~/.zsh_plugins.sh

echo "* Adding Symlinks"
stow tmux 
stow vim
stow zsh
stow git 
stow --adopt micro

echo "* Adding micro plugins"
micro -plugin install filemanager
micro -plugin install wc

echo "* Adding alias and functions to bashrc"
cat ~/.bashrc | grep -qF 'source ~/.dotfiles/bash/.bash_profile' || echo 'source ~/.dotfiles/bash/.bash_profile' >> ~/.bashrc

echo "* Adding vundle to vim - Remember to run vundle install first time."
[[ -d ~/.dotfiles/vim/.vim/bundle/Vundle.vim ]] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/vim/.vim/bundle/Vundle.vim
