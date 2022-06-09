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

## Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# echo 'eval "$(/home/hugo/.linuxbrew/bin/brew shellenv)"' >> /home/hugo/.profile
# eval "$(/home/hugo/.linuxbrew/bin/brew shellenv)"

#echo 'eval "$($HOME/.linuxbrew/bin/brew shellenv)"' >> $HOME/.profile
eval "$($HOME/.linuxbrew/bin/brew shellenv)"

## tools
brew install bat
brew install diff-so-fancy
brew install magic-wormhole
brew install hstr

## Add hstr to bash/zsh
hstr --show-configuration >> ~/.bashrc && . ~/.bashrc
hstr --show-configuration >> ~/.zshrc && . ~/.zshrc
