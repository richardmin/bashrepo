function cdLs() {
    cd "$@" && ls
}

alias cd='cdLs'

# from oh-my-zsh
alias l='ls -lFh' # perms | # of items | owner | group | size | date | item
alias ll='ls -lAFh' # same as above, but with hidden items
alias lr='ls -tRFh' # l but sorted by date
alias lt='ls -ltFh' # same as above, but with hidden items
alias ldot='ls -ld .*' # only hidden items
alias lS='ls -1FSsh' # show items with biggest first.
alias lart='ls -1Fcart' # show oldest items first, including hidden items
alias lrt='ls -1Fcrt' # show oldest items first, no hidden items

alias t='tail -f'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias help='man'
alias h='history'


alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias bat="pmset -g batt"
fi
