#!/bin/bash


set -e

REMOTE=0
SHOW_UNMERGED=0

while getopts ru option; do
    case "${option}" in
        r) REMOTE=1 ;;
        u) SHOW_UNMERGED=1 ;;
    esac
done

# Always run this from master
# git checkout -q master

# Fetch and prune
git fetch --prune

# Delete local merged branches
git branch --merged | grep -v '\*\|master\|develop' | xargs -n 1 git branch -d

# Delete remote merged branches
if [[ $REMOTE -eq 1 ]]; then
    git branch -r --merged | perl -ne 'print "$1\n" if /origin\/(.*)/ and !/HEAD/ and !/master/' | xargs -n 1 git push origin --delete
fi

if [[ $SHOW_UNMERGED -eq 1 ]]; then
    echo "Unmerged local branches:"
    echo
    git branch --no-merged

    if [[ $REMOTE -eq 1 ]]; then

    fi
fi
