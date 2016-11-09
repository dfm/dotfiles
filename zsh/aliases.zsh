alias lsa="ls -lah"
alias l="ls -la"
alias ll="ls -l"
alias sl=ls

alias c="clear"
alias v="vim"

alias mkhtml="ls *.png | awk '{print \"<img src=\\\"\" $1 \"\\\" />\"}' > index.html"

# Clean up and update conda packages
alias cup="conda clean -pity;conda update --all"
