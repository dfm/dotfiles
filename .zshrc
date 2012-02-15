# oh-my-zsh
ZSH=$HOME/lib/oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
plugins=(brew git github heroku osx pip python )
source $ZSH/oh-my-zsh.sh

# Default path
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"

# My bin
PATH="${HOME}/bin:${PATH}"

# Python scripts
PATH="/usr/local/share/python:${PATH}"

# LaTeX
PATH="/usr/local/texlive/2011/bin/x86_64-darwin:${PATH}"

export PATH

# Enable z
. ${HOME}/lib/z/z.sh
function precmd () {
    _z --add "$(pwd -P)"
}

