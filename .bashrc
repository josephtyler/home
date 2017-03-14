# alias lld="mosh tyler@tyler.zimbiodev.com"
alias lld="ssh tyler@tyler.zimbiodev.com"
# alias kick="mosh tyler@ec2-54-208-61-73.compute-1.amazonaws.com"
alias kick="mosh tyler@kickstart.howchoo.com"
alias kick-s="ssh -l tyler ec2-54-208-61-73.compute-1.amazonaws.com"
alias ll="ls -lha"

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
PATH="$PATH:$HOME/bin"
PS1="$GREEN\u@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR$RED\$(parse_git_status)$NO_COLOR\$ "

if [[ -f "$HOME/.local.bashrc" ]]; then
    source "$HOME/.local.bashrc"
fi

if [[ -f /usr/local/etc/bash_completion.d/password-store ]]; then
    source /usr/local/etc/bash_completion.d/password-store
fi

if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
    export WORKON_HOME=~/Envs
    if [[ ! -d $WORKON_HOME ]]; then
        mkdir $WORKON_HOME
    fi
fi

export PATH=$PATH:$HOME/bin
