# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cubec-nok"

# Example aliases
# alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby docker lighthouse)
plugins=(osx git python django docker node)


# Customize to your needs...

#---------------------------------------------------------------------
# prompt and path
export PATH=$HOME:/usr/local/bin:/usr/local/sbin:/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:/usr/local/share/npm/bin:$PATH:/sbin

#---------------------------------------------------------------------
# env setup
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# gnuchlog vim plugin
export EMAIL="Kfir Breger <kfir@conopa.co>"
export EDITOR="vim"
#---------------------------------------------------------------------
# Docker
export DOCKER_ID_USER="kfirbreger"
#---------------------------------------------------------------------
# python
#export PYTHONSTARTUP=~/.pyinit
export PROJECT_HOME=$HOME/develop
export VIRTUALENV_ROOT=~/venvs
#---------------------------------------------------------------------
# NODE.JS
export NODE_PATH=/usr/local/lib/node_modules:/usr/local/lib/node:$NODE_PATH
export JS_CMD=node
#---------------------------------------------------------------------
# Go
export GOPATH="/Users/kfir/develop/go"
export PATH=$PATH:$GOPATH/bin
#---------------------------------------------------------------------
# alias
alias la="ls -la"
alias ll="ls -l"
alias serve="python -m SimpleHTTPServer"
# Docker compose
alias dcup='docker-compose up -d'
alias dcd='docker-compose down'
alias dcr='docker-compose down && docker-compose build && docker-compose up -d'
alias c='docker-compose'

alias k='kubectl'
#---------------------------------------------------------------------
# Functions
function clear_docker() {
	Echo "Clearing all Docker data"
	docker ps --filter status=dead --filter status=exited -aq | xargs docker rm -v
	docker images --no-trunc | awk '{ print $3 }' | xargs docker rmi -f
	docker volume ls -qf dangling=true | xargs docker volume rm
}
function brewdeps() {
    brew list | while read cask; do echo -n $fg[blue] $cask $fg[white]; brew deps $cask | awk '{ printf(" %s ", $0) }'; echo ''; done
}
#---------------------------------------------------------------------
# Sourceing kube ps1. use kubeon and kubeoff to turn prompt on and off
# source $HOME/develop/servers/kube-ps1/kube-ps1.sh

# autocomplete
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# complete -o nospace -C /Users/kfir/klanten/kpn/vault/vault vault

# Adding oh-my
source $ZSH/oh-my-zsh.sh


