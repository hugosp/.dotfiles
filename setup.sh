#!/bin/bash

### tmux
#[[ -d tmux-powerline ]] || git clone https://github.com/erikw/tmux-powerline.git
#cp tmux-theme.sh ./tmux-powerline/themes/default.sh

### SYMLINKS
echo "Adding Symlinks"
[[ -f  ~/.tmux.conf ]] || ln -sv ~/.dotfiles/.tmux.conf ~
[[ -f  ~/.vim ]] || ln -sv ~/.dotfiles/vim/ ~/.vim

## ADD READ BASH-EXTRAS TO .bashrc
echo "Adding alias and functions to bashrc"
cat ~/.bashrc | grep -qF 'source ~/.dotfiles/.bash_profile' || echo 'source ~/.dotfiles/.bash_profile' >> ~/.bashrc

 ## Add vundle to vim
echo "Adding vundle to vim - Remember to run vundle install first time."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/vim/bundle/Vundle.vim



