#!/bin/bash

set -e

function remove_old_packages() {
    cd $HOME/.dotfiles/vim/bundle
    git status -s | grep -E "^\?\?" | cut -d ' ' -f 2 | xargs rm -rf
}

function main() {
    echo "Updating dotfiles..."
    cd $HOME/.dotfiles
    git pull
    git submodule update --init
    git submodule foreach git pull origin master
    remove_old_packages
    git commit "$HOME/.vim/bundle/" -m "Updating vim submodules"
}

main
