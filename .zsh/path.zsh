export PATH="$HOME/.node/bin:$PATH"
export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:/usr/local/go/bin"

export NODE_ENV=development
export DEFAULT_USER=`whoami`

export TERM=xterm-256color

if [ -f ~/.local_path ]; then
    . ~/.local_path
fi
