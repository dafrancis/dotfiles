alias chdiff="svn diff --diff-cmd=$HOME/.dotfiles/bash_scripts/diffwrap.sh --changelist"

function check_changes() {
    if [ $# -eq 0 ]; then
        echo "Missing changelist. Choose one of the following:"
        svn st -q | grep "^---" | sed -e "s/--- Changelist '//g" -e "s/'://g"
    else
        chdiff $1
    fi
}

function commit_changes {
    if [ $# -eq 0 ]; then
        echo "Missing changelist. Choose one of the following:"
        svn st -q | grep "^---" | sed -e "s/--- Changelist '//g" -e "s/'://g"
    else
        if [ $# -eq 1 ]; then
            echo -n "Enter your commit message: "
            read message
        else
            message=$2
        fi
        if [ $message ]; then
            svn commit --cl $1 -m "$1 : $message"
            echo "Changes for ticket $1 committed!"
        else
            echo "No message provided. Exiting"
        fi
    fi
}

function svn_remove_cl() {
    svn revert --cl $1 -R .
    svn status |\
    sed -n "/--- Changelist '$1':/,/--- Changelist.*/p" |\
    grep -v '^--- Changelist' |\
    xargs svn changelist --remove
}

function default_changelist() {
    svn st -q | xargs | sed -e 's/Performing status on external item.*//g' -e 's/ \([MAD]\)/\
\1/g'
}
