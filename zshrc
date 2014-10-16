export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vip="$HOME/.dotfiles/vip/vip.sh"
alias dot="$HOME/.dotfiles/dot/dot.sh"
alias v="$HOME/.dotfiles/bash_scripts/find_vcs.sh"

COMPLETION_WAITING_DOTS="true"

ZSH_CUSTOM="$HOME/.dotfiles/zsh/"

plugins=(git zsh-syntax-hilighting sublime svn python fabric jira svn-changelist inits)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/afal/.rvm/bin:/Applications/Xcode.app/Contents/Developer/usr/subversion-1.6/bin"
# export MANPATH="/usr/local/man:$MANPATH"
export VIM=$HOME/vimscript/runtime/

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='subl'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Special SSH alias which changes the Terminal profile,
# so that terminals on production servers can be
# automatically coloured.
alias ssh="$HOME/.dotfiles/bash_scripts/safe_colour_ssh $1"

alias serve="python -m SimpleHTTPServer"
alias json="python -mjson.tool"
alias tmux="TERM=screen-256color-bce tmux"
alias s=subl
alias up="svn up"
alias sdiff="svn diff --diff-cmd=$HOME/.dotfiles/bash_scripts/diffwrap.sh"
alias fancylog="$HOME/.dotfiles/bash_scripts/fancylog.sh"
alias svnall="$HOME/.dotfiles/bash_scripts/svnall"
alias disk_space="df -kh"
alias space_lookup="du -ksh *"
alias rmedited="svn st | grep -E '^\?' | awk '{ print $2  }' | grep -E '\.edited$' | rm -rf"
export SVN_EDITOR=vim

function ssh-ft() {
    ssh -i $HOME/.ssh/df_ft_rsa -l dafydd.francis $@
}

function reload() {
    source ~/.zshrc
    clear
}

function dev_projects() {
    ls /Users/dafrancis/bawe | grep "DEV"
}

function project_check() {
    cd /Users/dafrancis/bawe
    ls | grep "DEV" | sort > checkouts.tmp
    cat *.sublime-project | grep path | awk -F'"' '{print $4}' | sed 's/.*\///g' | grep "DEV" | sort > projects.tmp
    diff projects.tmp checkouts.tmp | awk '{print $2}' | grep "DEV" | sort
    rm -rf *.tmp
}

function svn_add_missing() {
    svn st "$1" | grep -E '^\?' | awk '{ print $2 }' | xargs svn add
}

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

