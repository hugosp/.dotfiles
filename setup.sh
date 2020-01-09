#!/bin/bash

### tmux
[[ -d tmux-powerline ]] || git clone https://github.com/erikw/tmux-powerline.git
cp tmux-theme.sh ./tmux-powerline/themes/default.sh

### SYMLINKS
[[ -f  ~/.tmux.conf ]] || ln -sv ~/.dotfiles/.tmux.conf ~

## ADD READ BASH-EXTRAS TO .bashrc
 cat ~/.bashrc | grep -qF 'source ~/.dotfiles/.bash_profile' || echo 'source ~/.dotfiles/.bash_profile' >> ~/.bashrc



