alias errcho='>&2 echo'

# Ref: https://github.com/leouieda/dotfiles
cenv() {
read -r -d '' CENV_HELP <<-'EOF'
Usage: cenv [COMMAND] [FILE]
Detect, activate, delete, and update conda environments.
FILE should be a conda .yml environment file.
If FILE is not given, assumes it is environment.yml.
Automatically finds the environment name from FILE.
Commands:
  None     Activates the environment
  rm       Delete the environment
  up       Update the environment
EOF
    envfile="environment.yml"
    if [[ $# -gt 2 ]]; then
        errcho "Invalid argument(s): $@";
        return 1;
    elif [[ $# == 0 ]]; then
        cmd="activate"
    elif [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
        echo "$CENV_HELP";
        return 0;
    elif [[ "$1" == "rm" ]]; then
        cmd="delete"
        if [[ $# == 2 ]]; then
            envfile="$2"
        fi
    elif [[ "$1" == "up" ]]; then
        cmd="update"
        if [[ $# == 2 ]]; then
            envfile="$2"
        fi
    elif [[ $# == 1 ]]; then
        envfile="$1"
        cmd="activate"
    else
        errcho "Invalid argument(s): $@";
        return 1;
    fi

    # Check if the file exists
    if [[ ! -e "$envfile" ]]; then
        errcho "Environment file not found:" $envfile;
        return 1;
    fi

    # Get the environment name from a conda yml file
    envname=$(grep "name: *" $envfile | sed -n -e 's/name: //p')

    if [[ $cmd == "activate" ]]; then
        conda activate "$envname";
    elif [[ $cmd == "update" ]]; then
        errcho "Updating environment:" $envname;
        conda activate "$envname";
        conda env update -f "$envfile"
    elif [[ $cmd == "delete" ]]; then
        errcho "Removing environment:" $envname;
        conda deactivate;
        conda env remove --name "$envname";
    fi
}