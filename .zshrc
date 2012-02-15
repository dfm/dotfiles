# oh-my-zsh
ZSH=$HOME/lib/oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
plugins=(brew git github heroku osx pip python )
source $ZSH/oh-my-zsh.sh

# PATH
# Default path
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"
# My bin
PATH="${HOME}/bin:${PATH}"
# Python scripts
PATH="/usr/local/share/python:${PATH}"
# LaTeX
PATH="/usr/local/texlive/2011/bin/x86_64-darwin:${PATH}"
export PATH

# Aliases
alias j='z'
alias c='clear'

# Customizations
export GREP_OPTIONS='--color=auto'
export EDITOR="vim"
export SVN_EDITOR="vim"

# Enable z
. ${HOME}/lib/z/z.sh
function precmd () {
    _z --add "$(pwd -P)"
}

# Finally, local settings
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi

