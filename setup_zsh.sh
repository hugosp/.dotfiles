#!/bin/bash

sudo apt install zsh
sudo apt install zsh-syntax-highlighting
sudo apt install zsh-autosuggestions

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git

git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

source zsh-snap/install.zsh

[[ -e  ~/.zshrc ]] || ln -sv ~/.dotfiles/zsh/.zshrc ~

