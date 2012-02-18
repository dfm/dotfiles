# oh-my-zsh
ZSH=$HOME/lib/oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
plugins=(brew git github heroku osx pip python )
source $ZSH/oh-my-zsh.sh

# Aliases
alias j='z'
alias c='clear'
alias v='vim'

# Generate an html file containing all png files in the directory
alias mkhtml=\
    "ls *.png | awk '{print \"<img src=\\\"\" $1 \"\\\" />\"}' > index.html"

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

