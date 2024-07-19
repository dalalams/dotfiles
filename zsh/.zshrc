export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=~/.npm-global/bin:$PATH
export PATH=$PATH:/usr/local/sbin
export PATH=/Library/PostgreSQL/13/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/go/bin:$PATH
. "$HOME/.cargo/env"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"

# zsh plugins
plugins=(git vi-mode fzf)

# vi mode configurations
VI_MODE_SET_CURSOR=true
bindkey -M viins 'jk' vi-cmd-mode

source $ZSH/oh-my-zsh.sh

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt inc_append_history 
setopt SHARE_HISTORY 
setopt HIST_REDUCE_BLANKS 
setopt HIST_VERIFY 
setopt hist_ignore_all_dups
setopt hist_ignore_space 
setopt globdots 

# VSCode
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# NVM
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

## >>> rbenv
#eval "$(rbenv init -)"
##
