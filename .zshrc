setopt HIST_IGNORE_SPACE

ANTIGEN_VERSION=1.4.0
ANTIGEN_ZSH=$HOME/antigen.zsh
if [ ! -f "$ANTIGEN_ZSH" ]; then
    echo "getting antigen v$ANTIGEN_VERSION"
    curl https://cdn.rawgit.com/zsh-users/antigen/v$ANTIGEN_VERSION/bin/antigen.zsh > "$ANTIGEN_ZSH"
fi

source "$ANTIGEN_ZSH"

export _ANTIGEN_CACHE_ENABLED=true

antigen use oh-my-zsh

antigen init $HOME/.antigenrc

antigen apply

[[ -s /data/data/com.termux/files/home/.autojump/etc/profile.d/autojump.sh ]] && source /data/data/com.termux/files/home/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

# TODO: doesn't take the first time for some reason
antigen theme bhilburn/hackersaurus
antigen theme bhilburn/hackersaurus

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"                  # $EDITOR should open in terminal
alias e=$EDITOR

if [ ! -d "$HOME/storage/" ]; then
    echo 'setting up storage symlinks'
    termux-setup-storage
fi
