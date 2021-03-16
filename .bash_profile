export PATH="$HOME/.dotfiles/bin:$PATH"

source ~/.dotfiles/.functions
source ~/.dotfiles/.aliases

# if always tmux

#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#    tmux attach -t default || tmux new -s default
#fi
