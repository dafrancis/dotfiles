# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vip="~/.dotfiles/vip/vip.sh"
alias dot="~/.dotfiles/dot/dot.sh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-hilighting sublime svn python fabric jira)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/afal/.rvm/bin:/Applications/Xcode.app/Contents/Developer/usr/subversion-1.6/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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
alias s="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias up="svn up"
alias sdiff="svn diff --diff-cmd=$HOME/.dotfiles/bash_scripts/diffwrap.sh"
alias chdiff="svn diff --diff-cmd=$HOME/.dotfiles/bash_scripts/diffwrap.sh --changelist"
alias fancylog="$HOME/.dotfiles/bash_scripts/fancylog.sh"
alias disk_space="df -kh"
alias space_lookup="du -ksh *"
export SVN_EDITOR=vim


function ssh-ft() {
    ssh -i $HOME/.ssh/df_ft_rsa -l dafydd.francis $@ || ssh -i $HOME/.ssh/df_ft_rsa -l dafyddfrancis $@
}

function reload() {
    source ~/.zshrc
    clear
}

function check_changes() {
    if [ $# -eq 0 ]
    then
        echo "Missing changelist. Choose one of the following:"
        svn st -q | grep "^---" | sed -e "s/--- Changelist '//g" -e "s/'://g"
    else
        chdiff $1
    fi
}

function commit_changes {
    if [ $# -eq 0 ]; then
        echo "Missing changelist. Choose one of the following:"
        svn st -q | grep "^---" | sed -e "s/--- Changelist '//g" -e "s/'://g"
    else
        if [ $# -eq 1 ]; then
            echo -n "Enter your commit message: "
            read message
        else
            message=$2
        fi
        if [ $message ]; then
            svn commit --cl $1 -m "$1 : $message"
            echo "Changes for ticket $1 committed!"
        else
            echo "No message provided. Exiting"
        fi
    fi
}

function svn_remove_cl() {
    svn revert --cl $1 -R .
    svn status |\
    sed -n "/--- Changelist '$1':/,/--- Changelist.*/p" |\
    grep -v '^--- Changelist' |\
    xargs svn changelist --remove
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

function laundry() {
    for project in `dev_projects`; do
        rm -rf /Users/dafrancis/bawe/$project/BacsActive/ui/media/* || echo
        rm -rf /Users/dafrancis/bawe/$project/install/Mysql* || echo
    done
}

function default_changelist() {
svn st -q | xargs | sed -e 's/Performing status on external item.*//g' -e 's/ \([MAD]\)/\
\1/g'
}

function make_inits() {
    find . -type d | grep -v svn | awk '{ print "touch " $0 "/__init__.py" }' | sh
}

function remove_inits() {
    find . -type d | grep -v svn | awk '{ print "rm -rf " $0 "/__init__.p* }" }' | sh
    #svn st | grep -E "^\?.*__init__.py$" | awk '{ print $2  }' | xargs rm -rf
}

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

