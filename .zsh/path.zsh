# Javascript Path
[ -d "$HOME/.node/bin" ] && export PATH="$PATH:$HOME/.node/bin"
[ -x "$(command -v yarn)" ] && export PATH="$PATH:`yarn global bin`"
export NODE_ENV=development

# Go Path
[ -d "/usr/local/go/bin$" ] && export PATH="$PATH:/usr/local/go/bin"

if [ -f ~/.local_path ]; then
    . ~/.local_path
fi
