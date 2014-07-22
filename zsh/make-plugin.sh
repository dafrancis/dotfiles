#!/bin/bash

set -e

PLUGINS=$HOME/.dotfiles/zsh/plugins/

function main() {
    plugin_name=$1
    mkdir -p $PLUGINS$plugin_name
    $EDITOR $PLUGINS$plugin_name/$plugin_name.plugin.zsh
}

main $@
