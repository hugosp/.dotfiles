export PATH="$HOME/.dotfiles/bin:$PATH"

source ~/.dotfiles/bash/.functions
source ~/.dotfiles/bash/.aliases

if [[ "$0" = "-bash"  ]] ; then
    # bash-git-prompt
    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_THEME=Hewgo
    source ~/.dotfiles/bash/bash-git-prompt/gitprompt.sh
fi
