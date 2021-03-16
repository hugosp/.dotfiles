#!/bin/bash

### SYMLINKS
echo "* Adding Symlinks"
[[ -f  ~/.tmux.conf ]] || ln -sv ~/.dotfiles/tmux/.tmux.conf ~
[[ -d  ~/.vim ]] || ln -sv ~/.dotfiles/vim/ ~/.vim

## ADD READ BASH-EXTRAS TO .bashrc
echo "* Adding alias and functions to bashrc"
cat ~/.bashrc | grep -qF 'source ~/.dotfiles/bash/.bash_profile' || echo 'source ~/.dotfiles/bash/.bash_profile' >> ~/.bashrc

 ## Add vundle to vim
echo "* Adding vundle to vim - Remember to run vundle install first time."
[[ -d ~/.dotfiles/vim/bundle/Vundle.vim ]] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/vim/bundle/Vundle.vim



