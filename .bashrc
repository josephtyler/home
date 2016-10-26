alias lld="mosh tyler@tyler.zimbiodev.com"
alias kick="ssh -l tyler ec2-54-208-61-73.compute-1.amazonaws.com"

function parse_git_branch () {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function parse_git_status () {
    git diff --quiet 2> /dev/null
    if [[ $? -eq 1 ]]; then
        echo " * "
    fi
}

YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
RED="\[\033[0;31m\]"
NO_COLOR="\[\033[0m\]"
PS1="$GREEN\u@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR$RED\$(parse_git_status)$NO_COLOR\$ "

if [[ -f "$HOME/.local.bashrc" ]]; then
    source "$HOME/.local.bashrc"
fi

if [[ -f /usr/local/etc/bash_completion.d/password-store ]]; then
    source /usr/local/etc/bash_completion.d/password-store
fi

export PATH=$PATH:$HOME/bin
