#!/bin/bash

bundle=$1

function github_url() {
    echo "https://github.com/$bundle"
}

function main() {
    #open `github_url`
    google-chrome `github_url`
}

main
