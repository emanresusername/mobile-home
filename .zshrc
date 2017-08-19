export ZPLUG_HOME=$HOME/.zplug
local zplug_init=$ZPLUG_HOME/init.zsh
if [ ! -f "$zplug_init" ] &> /dev/null; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi
source $zplug_init

zplug "plugins/emacs", \
      from:oh-my-zsh, \
      hook-build:"termux-fix-shebang plugins/emacs/*"

zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/gitfast", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "emanresusername/zsh-plugins", use:cowfiles

zplug "st42/termux-sudo", \
      as:command, \
      use:"sudo"

zplug "MichaelAquilina/zsh-emojis"

zplug "wting/autojump", \
      use:"bin/autojump", \
      as:command, \
      hook-build:"termux-fix-shebang bin/*"

zplug "wting/autojump", \
      use:"bin/autojump.zsh"

zplug "rg3/youtube-dl", \
      hook-build:"termux-fix-shebang bin/*"

zplug "emanresusername/zsh-plugins", \
      use:youtube-dl-aria2, \
      on:"rg3/youtube-dl"

zplug "emanresusername/oh-my-zsh", \
      use:"lib/clipboard.zsh"
zplug "lib/history", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", \
      on:"zsh-users/zsh-syntax-highlighting", \
      defer:2, \
      hook-load:"
      bindkey -M emacs '^P' history-substring-search-up;
      bindkey -M emacs '^N' history-substring-search-down;
      bindkey '^[[A' history-substring-search-up;
      bindkey '^[[B' history-substring-search-down;
      bindkey -M vicmd 'k' history-substring-search-up;
      bindkey -M vicmd 'j' history-substring-search-down;
"

zplug "junegunn/fzf-bin", \
      from:gh-r, \
      as:command, \
      rename-to:fzf, \
      use:"*linux_arm8*"

zplug "junegunn/fzf", \
      as:command, \
      use:"bin/fzf-tmux", \
      on:"junegunn/fzf-bin", \
      hook-build:"termux-fix-shebang bin/*"

zplug "b4b4r07/enhancd", \
      use:init.sh, \
      on:"junegunn/fzf-bin"

POWERLEVEL9K_INSTALLATION_PATH=$ZPLUG_REPOS/bhilburn/powerlevel9k
zplug "bhilburn/powerlevel9k", \
      use:powerlevel9k.zsh-theme

# tmux
zplug "jreese/zsh-titles"
zplug "TBSliver/zsh-plugin-tmux-simple"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
