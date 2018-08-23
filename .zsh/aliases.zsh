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

alias t='tail -f'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias bat="pmset -g batt"
fi








