#!/bin/bash

command=$1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function main() {
    subcommand_script="$DIR/subcommands/$command.sh"
    if [ -z $command ]; then
        echo "vip: vim pathogen manager"
    elif [ -f $subcommand_script ]; then
        shift
        bash $subcommand_script $@
    else
        echo "vip: Unrecognised command"
    fi
}

main $@
