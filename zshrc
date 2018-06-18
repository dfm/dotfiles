fpath=("$HOME/lib/dotfiles/zsh/functions" $fpath)

autoload -U compinit
compinit -i

# Source all the config files.
for config_file ($HOME/lib/dotfiles/**/*.zsh) source $config_file

# Add bin to path
export PATH=$HOME/lib/dotfiles/bin:$PATH

# Finally, local settings
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
