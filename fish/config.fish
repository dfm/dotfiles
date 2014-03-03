# General settings.
set BROWSER open
set -g -x fish_greeting ''
set -g -x EDITOR vim

# Useful aliases.
function ..;    cd ..; end
function ...;   cd ../..; end
function ....;  cd ../../..; end
function .....; cd ../../../..; end
function lsa;   ls -lah $argv; end
function l;     ls -la $argv; end
function ll;    ls -l $argv; end
function sl;    ls $argv; end
function c;     clear; end

# Hook in completions.
make_completion v "vim"
make_completion g "git"
make_completion gc "git commit"
make_completion gst "git status"

# Add in the Anaconda path.
set -g -x PATH $HOME/anaconda/bin $PATH

# Source any local settings.
if test -s $HOME/.config/fish/local.fish
    . $HOME/.config/fish/local.fish
end
