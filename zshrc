export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/.dotfiles

ZSH_THEME="avit"
COMPLETION_WAITING_DOTS="true"
ZSH_CUSTOM="$HOME/.dotfiles/zsh/"

plugins=(git zsh-syntax-hilighting sublime svn python fabric jira svn-changelist inits)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/shellrc/shell

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='subl'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

function reload() {
    source ~/.zshrc
    reset && clear
}

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
