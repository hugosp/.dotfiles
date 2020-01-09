#!/bin/bash
[[ -d tmux-powerline ]] || git clone https://github.com/erikw/tmux-powerline.git

### SYMLINKS

#ln -sv ~/.dotfiles/.bash_profile ~
[[ -f  ~/.tmux.conf ]] || ln -sv ~/.dotfiles/.tmux.conf ~

## FUNCTIONS & ALIASES
cat ~/.bashrc | grep -qF 'source ~/.dotfiles/.functions' || echo 'source ~/.dotfiles/.functions' >> ~/.bashrc
cat ~/.bashrc | grep -qF 'source ~/.dotfiles/.aliases' || echo 'source ~/.dotfiles/.aliases' >> ~/.bashrc

