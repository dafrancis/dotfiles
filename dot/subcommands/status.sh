#!/bin/bash

set -e

function get_status() {
    cd $HOME/.dotfiles
    git status
}

function main() {
    get_status
}

main
