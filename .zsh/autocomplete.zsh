source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz compinit
compinit -d "$ZSH_CACHE/zcompdump"
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE

# description for options with exactly one argument
zstyle ':completion:*' auto-description 'specify: %d'

# match uppercase from lowercase	
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Make zsh know about hosts already accessed by SSH	
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

zstyle ':completion:*' list-colors ''

zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

zstyle ':completion:*' completer _expand _complete _correct _approximate

zstyle ':completion:*' menu select=2 _expand _complete _correct _approximate
