# alias kick="mosh tyler@ec2-54-208-61-73.compute-1.amazonaws.com"
alias kick="mosh tyler@kickstart.howchoo.com"
alias kick-s="ssh -l tyler ec2-54-208-61-73.compute-1.amazonaws.com"
alias ll="ls -lha"

alias ctags="`brew --prefix`/bin/ctags"
alias python="python3"
alias g="granite"
alias hcgke="gcloud container clusters get-credentials production --zone us-west1-c --project howchoo-161906"
alias kgp="kubectl get pods --field-selector=status.phase=Running"

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_NONE="\e[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "Changes not staged for commit" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Changes to be committed" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

kube_prompt() {
   kubectl_current_context=$(kubectl config current-context)
   kubectl_project=$(echo $kubectl_current_context | cut -d '_' -f 2)
   kubectl_cluster=$(echo $kubectl_current_context | cut -d '_' -f 4)
   kubectl_prompt="($kubectl_project|$kubectl_cluster)"
   echo $kubectl_prompt
}

PS1="\[$COLOR_WHITE\][\W]"    # basename of pwd
PS1+="\[\$(git_color)\]"        # colors git status
PS1+="\$(git_branch)"           # prints current branch
PS1+="\[$COLOR_BLUE\]\$(kube_prompt)\[$COLOR_NONE\]"
PS1+="\n$ "
export PS1

if [[ -f "$HOME/.local.bashrc" ]]; then
    source "$HOME/.local.bashrc"
fi

if [[ -f /usr/local/etc/bash_completion.d/password-store ]]; then
    source /usr/local/etc/bash_completion.d/password-store
fi

if [[ -f "$HOME/.bash_completion" ]]; then
    source "$HOME/.bash_completion"
fi

if [[ -f "$HOME/.git-completion" ]]; then
    source "$HOME/.git-completion"
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
    export WORKON_HOME=~/Envs
    if [[ ! -d $WORKON_HOME ]]; then
        mkdir $WORKON_HOME
    fi
fi

export PATH=$PATH:$HOME/bin:$HOME/Library/Python/3.6/bin:$HOME/repos/howchoo/bin:$HOME/repos/etl-java/bin:$HOME/repos/kubernetes-configs/bin:$HOME/repos/web/bin/commands

eval "$(_GRANITE_COMPLETE=source granite)"
