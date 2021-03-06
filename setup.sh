#!/bin/bash

set -e

function is_mac() {
    [ "`uname`" == "Darwin" ]
}

function setup_zsh() {
    # Setup zsh as default shell
    # TODO: fix this so it doesn't fail when using babun
    # chsh -s /bin/zsh
    # This should probably go to the backup plan if it fails
    # (the backup plan is use bash)

    # Install Oh My Zsh
    ls ~/.oh-my-zsh || curl -L http://install.ohmyz.sh | sh

    # Link zshrc
    ln -fs ~/.dotfiles/zshrc ~/.zshrc
    source ~/.zshrc
}

function setup_bash() {
    echo "-- (Bash Mode currently in todo mode)"
    rm -rf ~/.bashrc # Delete any default bashrc
    ln -fs ~/.dotfiles/bashrc ~/.bashrc
    source ~/.bashrc

    # Hey it's not as fleshed out as zshrc but it's something I guess
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
    # idk why you'd want to do this because no one uses neovim
    # Why am I talking to myself?
}

function setup_hydra() {
    rm -rf ~/.mjolnir
    ln -fs ~/.dotfiles/mjolnir ~/.mjolnir
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
    sh ~/.dotfiles/dot/subcommands/update.sh
}

main
