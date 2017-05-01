# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export EDITOR=vim

# Set name of the theme to load.
ZSH_THEME="agnoster"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true" # enable command auto-correction
COMPLETION_WAITING_DOTS="true"
# Formats for the history command:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="yyyy-mm-dd"
source $ZSH/oh-my-zsh.sh
plugins=(git docker cp mv brew vim go golang osx mysql-macports python react-native)


# Option Configurations
HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=1000
setopt histignorealldups
setopt histreduceblanks
setopt sharehistory
setopt automenu
setopt autocd
setopt nohup
setopt correct
setopt automenu
autoload -Uz compinit
compinit
zstyle :compinstall filename '~/.zshrc'

# Fix Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Cross-Platform Aliases
function cdAndLs() {
    cd "$@" && ls
}

alias cd='cdAndLs'
alias touch='nocorrect touch'

# MONGOD Managament functions
# From https://gist.github.com/m-szk/1306735
# Accessed on May 1 2017
stopMongo() {
    grep_mongo=`ps aux | grep -v grep | grep "${mongod}"`
    if [ ${#grep_mongo} -gt 0 ]
    then
        echo "Stop MongoDB."
        PID=`ps x | grep -v grep | grep "${mongod}" | awk '{ print $1 }'`
        `kill -2 ${PID}`
        RETVAL=$?
    else
        echo "MongoDB is not running."
    fi
}
startMongo() {
    grep_mongo=`ps aux | grep -v grep | grep "${mongod}"`
    if [ -n "${grep_mongo}" ]
    then
        echo "MongoDB is already running."
    else
        echo "Start MongoDB."
        `${mongod} --dbpath ${mongod_data} --logpath ${mongod_log} --fork --logappend`
        RETVAL=$?
    fi
}

#from oh-my-zsh
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias zshrc='$EDITOR ~/.zshrc' # Quick access to the ~/.zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias cp='cp -i'
alias mv='mv -i'

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#ls colours
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''


# Sourcing System Local Files
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -f ~/.path ]; then
    source ~/.path
fi

# System specific Commands
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias bat="pmset -g batt"
fi
