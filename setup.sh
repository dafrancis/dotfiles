A
#!/bin/bash

set -e

function is_mac() {
    [ "`uname`" == "Darwin" ]
}

function setup_zsh() {
    # Setup zsh as default shell
    chsh -s /bin/zsh

    # Install Oh My Zsh
    curl -L http://install.ohmyz.sh | sh

    # Link zshrc
    ln -fs ~/.dotfiles/zshrc ~/.zshrc
}

function setup_bash() {
    # TODO make a bashrc
    echo "-- (Bash Mode currently in todo mode)"
}

function setup_shell() {
    if hash zsh 2>/dev/null; then
        echo "-- zsh detected, using zsh..."
        setup_zsh
    else
        echo "-- zsh not detected, using bash..."
        setup_bash
    fi
}

function setup_vim() {
    # Link vim
    ln -fs ~/.dotfiles/vimrc ~/.vimrc
    rm -rf ~/.vim
    ln -fs ~/.dotfiles/vim ~/.vim

    # Would you believe that neovim is literally the same as vim?
    # yes. yes you would.
    ln -fs ~/.dotfiles/vimrc ~/.nvimrc
    ln -fs ~/.dotfiles/vim ~/.nvim
}

function setup_hydra() {
    # So how about them window managers
    ln -fs ~/.dotfiles/hydra ~/.hydra
}

function main() {
    setup_shell
    setup_vim
    if `is_mac`; then
        echo "-- Mac detected, installing mac specific stuff..."
        setup_hydra
    else
        echo "-- You're probably using linux or bsd or something else so I'm not going to do anything"
    fi
}

main
