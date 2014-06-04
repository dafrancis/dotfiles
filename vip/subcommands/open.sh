#!/bin/bash

bundle=$1

function github_readme_api() {
    echo "https://api.github.com/repos/$bundle/readme"
}

function get_content() {
    curl -s `github_readme_api` | jq -r '.content'
}

function trim() {
    trimmed=$1
    trimmed=${trimmed%% }
    trimmed=${trimmed## }

    echo "$trimmed"
}

function get_readme() {
    get_content | base64 --decode
}

function github_url() {
    echo "https://github.com/$bundle"
}

function main() {
    #open `github_url` || google-chrome `github_url`
    get_readme | less
}

main
