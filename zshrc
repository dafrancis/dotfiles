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

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
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
alias stu="svn st | awk '/^\?/ { print \$2  }'"
alias rmedited="svn st | awk '/^\?/ { print \$2  }' | grep -E '\.edited$' | xargs rm -rf"
alias grest="svn st | awk '{ print \$2  }' | xargs grep -s"
alias search_hosts="grep -v -E '^(\s*|#.*)$' /etc/hosts | awk '{ print \$2  }' | grep"
alias ssh-ft="ssh -i $HOME/.ssh/df_ft_rsa -l dafydd.francis"
export SVN_EDITOR=vim

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
    cat *.sublime-project | awk -F'"' '/path/{print $4}' | sed 's/.*\///g' | grep "DEV" | sort > projects.tmp
    diff projects.tmp checkouts.tmp | awk '{print $2}' | grep "DEV" | sort
    rm -rf *.tmp
}

function svn_add_missing() {
    svn st "$1" | awk '/^\?/{ print $2 }' | xargs svn add
}

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
