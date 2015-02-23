export DOTFILES=$HOME/.dotfiles

if [ -f /etc/bash_completion ]; then . /etc/bash_completion
fi

source $DOTFILES/shellrc/shell
