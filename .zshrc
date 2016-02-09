#save 1000 lines of history to ~/.zsh_histfile
HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=1000

#no duplicate lines in history, if they're true dupes
setopt histignorealldups
#remove extra blanks
setopt histreduceblanks
setopt sharehistory
setopt automenu
#lazy cd: if there's no command with that name and a folder, it automatically cd's to the folder of the same name
setopt autocd
#don't kill background jobs
setopt nohup
#try to correct typoes of spellings
setopt correct

setopt automenu


autoload -Uz compinit
compinit

zstyle :compinstall filename '/home/ubuntu/.zshrc'

# Fix Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


#FUNCTION ALIASES

function lscolours() {
	ls "$@" --color
}

function cdAndLS() {
	cd "$@" && lscolours
}

alias ls='lscolours'
alias cd='cd'


mongod=/usr/local/mongodb/bin/mongod
mongod_data=/Users/michito/work/mongodb_data
mongod_log=/Users/michito/work/mongodb_log/mongodb.log
prog=mongod.sh
RETVAL=0

stop() {
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
start() {
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

alias startMongo='start'
alias stopMongo='stop'


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
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias whereami=display_info

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

  # open browser on urls
  _browser_fts=(htm html de org net com at cx nl se dk dk php)
  for ft in $_browser_fts ; do alias -s $ft=$BROWSER ; done

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts ; do alias -s $ft=$EDITOR ; done

  _image_fts=(jpg jpeg png gif mng tiff tif xpm)
  for ft in $_image_fts ; do alias -s $ft=$XIVIEWER; done

  _media_fts=(ape avi flv mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts ; do alias -s $ft=mplayer ; done

  #read documents
  alias -s pdf=acroread
  alias -s ps=gv
  alias -s dvi=xdvi
  alias -s chm=xchm
  alias -s djvu=djview

  #list whats inside packed file
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s tar.gz="echo "
  alias -s ace="unace l"


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

