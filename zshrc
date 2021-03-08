# Source all the config files.
for config_file ($HOME/src/dfm/dotfiles/**/*.zsh) source $config_file

# Finally, local settings
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi
