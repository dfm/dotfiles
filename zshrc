fpath=("$HOME/lib/dotfiles/zsh/functions" $fpath)

autoload -U compinit
compinit -i

# Source all the config files.
for config_file ($HOME/lib/dotfiles/**/*.zsh) source $config_file

# Enable z
. ${HOME}/lib/z/z.sh
function precmd () {
    _z --add "$(pwd -P)"
}

# Add bin to path
export PATH=$HOME/lib/dotfiles/bin:$PATH

# Finally, local settings
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi

# Todo.txt setup
alias t='todo.sh'
export TODOTXT_DEFAULT_ACTION=ls
source $HOME/lib/dotfiles/todo_completion

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
