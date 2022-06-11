#!/bin/bash

sudo apt install zsh
sudo apt install stow
sudo apt install hstr

### zsh as default
chsh -s $(which zsh)

### bundle zsh_plugins 
antibody bundle < ~/.dotfiles/zsh/.zsh_plugins.txt > ~/.zsh_plugins.sh

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
