# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/tyler/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# User aliases
alias ctags="`brew --prefix`/bin/ctags"

# Howchoo aliases
alias k="kubectl"
alias h="howchoo"
alias hd="howchoo dev"
alias hdm="howchoo dev manage"


# North
alias bvdebugger="docker-compose stop cms && docker-compose run --rm --service-ports cms"

export st="bvdeploy@staging-web2.bobvila.com"

if [[ -f $HOME/.zshrc.local ]]; then
    source $HOME/.zshrc.local
fi
export HOWCHOO_DIR=/Users/tyler/howchoo/backend  # Added by howchoo
PATH=$PATH:$HOWCHOO_DIR/bin/commands  # Added by howchoo

# fzf settings
export FZF_DEFAULT_COMMAND='fd --type f'

PATH=$PATH:$HOME/bin

# RUBY!!!
eval "$(rbenv init -)"

# Kubectl completion
source <(kubectl completion zsh)

# Functions
function de {
  docker exec -it $(docker ps | grep $1 | awk '{print $1}') ${@:2}
}

# Modify prompt
if [[ -f $HOME/.kube-ps1.sh ]]; then
    source $HOME/.kube-ps1.sh
    PROMPT='$(kube_ps1)'$PROMPT
fi
PROMPT=$PROMPT$'\n$ '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# TrackADM + The Drive helper configs
function list_image_tags {
  aws ecr describe-images --repository-name $1 --region $2 | jq '.imageDetails[].imageTags[]' | sort
}

function td_setup {
  export AWS_PROFILE=thedrive
  aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 693435214819.dkr.ecr.us-west-2.amazonaws.com
}

alias list_trackadm_image_tags="list_image_tags trackadm.com us-west-2"
