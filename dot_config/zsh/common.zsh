autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export CLICOLOR=true

function colours() {
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
}

# Enable ls colors
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'

export PAGER='less -r'
export GHI_PAGER='less -r'
export EDITOR=vim
export VISUAL=$EDITOR
export SVN_EDITOR=$EDITOR
