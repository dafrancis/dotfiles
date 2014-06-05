#!/bin/bash

set -e

function main() {
    echo "Updating dotfiles..."
    cd $HOME/.dotfiles
    git pull
    git submodule update --init
    git submodule foreach git pull origin master
    git commit "$HOME/.vim/bundle/" -m "Updating vim submodules"
}

main
