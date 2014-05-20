#!/bin/bash

REPO_PATH=~/.dotfiles
BUNDLE_DIR=vim/bundle
bundle=$1
name=$2

function http_status() {
    curl -sI `github_url` | grep "^HTTP" | awk '{ print $2 }'
}

function status_is() {
    status=$1
    [ `http_status` == $status ]
}

function github_url() {
    echo "https://github.com/$bundle.git"
}

function download() {
    echo "Downloading..."
    url=`github_url $bundle`
    cd $REPO_PATH
    git submodule add $url $BUNDLE_DIR/$name
    git add -A
    git commit -m "Install $url bundle as a submodule."
}

function check_and_download() {
    if status_is 301; then
        download
    else
        echo "No such bundle"
    fi
}

function main() {
    if [[ -z $bundle || -z $name ]]; then
        echo "Params missing!"
    elif [ -d $BUNDLE_DIR/$name ]; then
        echo "Already a bundle called '$name'"
    else
        check_and_download
    fi
}

main
