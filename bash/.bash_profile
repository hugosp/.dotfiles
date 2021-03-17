export PATH="$HOME/.dotfiles/bin:$PATH"

source ~/.dotfiles/bash/.functions
source ~/.dotfiles/bash/.aliases

# bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Hewgo
source ~/.dotfiles/bash/bash-git-prompt/gitprompt.sh
