A
#!/bin/bash

set -e

function is_mac() {
    [ "`uname`" == "Darwin" ]
}

function setup_zsh() {
    # Setup zsh as default shell
    chsh -s /bin/zsh
    # This should probably go to the backup plan if it fails
    # (the backup plan is use bash)

    # Install Oh My Zsh
    curl -L http://install.ohmyz.sh | sh

    # Link zshrc
    ln -fs ~/.dotfiles/zshrc ~/.zshrc
}

function setup_bash() {
    echo "-- (Bash Mode currently in todo mode)"
    rm -rf ~/.bashrc # Delete any default bashrc
    ln -fs ~/.dotfiles/bashrc ~/.bashrc

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
    # So how about them window managers
    ln -fs ~/.dotfiles/hydra ~/.hydra
    # haha didn't the developer change it to mjolnir after like 2 weeks?
    # and LITERALLY CHANGED EVERYTHING?
    # I should get around to setting up that probably
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
