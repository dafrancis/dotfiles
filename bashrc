export DOTFILES=$HOME/.dotfiles

if [ -f /etc/bash_completion ]; then . /etc/bash_completion
fi

source $DOTFILES/shellrc/shell

function reload() {
    source ~/.bashrc
    restart
    clear
}

export PS1='\n[\u@\h \w]\n\[\e[32m\]$ \[\e[0m\]'
