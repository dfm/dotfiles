# alias errcho='>&2 echo'
#
# # Inspired by: https://github.com/leouieda/dotfiles
# cenv() {
# read -r -d '' CENV_HELP <<-'EOF'
# Usage: cenv [ACTION] [ARGS]
# Manage your conda environments the way dfm wants to.
#
# Actions:
#   None         Creates or activates an environment
#   new|create   Creates a new environment
#   up|update    Update the environment
#   activate     Activates the environment
#   deactivate   Equivalent to 'conda deactivate'
#   add|install  Install a package
#   rm|remove|uninstall
#                Uninstall a package
#   clean        Remove the environment
#
# Arguments:
#   -h|--help    Show this message
#   -f|--file    The conda environment file to use (default: environment.yml)
#   -l|--lock    The environment lock file to use (default: environment.lock)
#   -p|--prefix  The prefix to use (default: ./env)
#   --pip        Install or uninstall a package with pip
# EOF
#
# condaVersion=`conda --version`
# echo "$condaVersion"
#
# # Find the action
# action="activate"
# case "$1" in
# new|create)
#   action="create"
#   shift
#   ;;
# activate)
#   action="activate"
#   shift
#   ;;
# deactivate)
#   action="deactivate"
#   shift
#   ;;
# add|install)
#   action="add"
#   shift
#   ;;
# rm|remove|uninstall)
#   action="remove"
#   shift
#   ;;
# up|update)
#   action="update"
#   shift
#   ;;
# clean)
#   action="clean"
#   shift
#   ;;
# esac
#
# if [[ "$action" = "deactivate" ]]; then
#   conda activate
#   return 0
# fi
#
# help=n
# pip=n
# envFile="environment.yml"
# lockFile="environment.lock"
# pipFile="requirements.txt"
# prefix="./env"
#
# # now enjoy the options in order and nicely split until we see --
# while true; do
#   case "$1" in
#     -h|--help)
#       help=y
#       shift
#       ;;
#     --pip)
#       pip=y
#       shift
#       ;;
#     -f|--file)
#       envFile="$2"
#       shift 2
#       ;;
#     -l|--lock)
#       lockFile="$2"
#       shift 2
#       ;;
#     -p|--prefix)
#       prefix="$2"
#       shift 2
#       ;;
#     --)
#       shift
#       break
#       ;;
#     *)
#       break
#       ;;
#   esac
# done
#
# if [[ "$help" = "y" ]]; then
#   echo $CENV_HELP
#   return 0
# fi
#
# if [[ "$action" = "clean" ]]; then
#   read -p "Remove this environment ($prefix)? [y/N]: " flag
#   if [[ "$flag" = "y" ]] || [[ "$flag" = "Y" ]]; then
#     echo -n "Removing: $lockFile $prefix"
#     rm -rf $lockFile $prefix
#   fi
#   return 0
# fi
#
# fileExists=n
# if [[ -e "$envFile" ]]; then
#   fileExists=y
# fi
# dirExists=n
# if [[ -d "$prefix" ]]; then
#   dirExists=y
# fi
#
# if [[ $fileExists = "n" ]]; then
#   if [[ "$action" = "activate" ]] || [[ "$action" = "update" ]]; then
#     action="create"
#   elif [[ "$action" != "create" ]]; then
#     echo "Environment file not found:" $envFile;
#     return 1
#   fi
# fi
#
# if [[ "$action" = "activate" ]]; then
#   if [[ $dirExists = "n" ]]; then
#     echo "Environment not found at: $prefix"
#     return 1
#   fi
#   echo "Activating environment: $prefix"
#   conda activate $prefix
#   return 0
# fi
#
# if [[ "$action" = "create" ]]; then
#   if [[ $dirExists = "y" ]]; then
#     echo "Prefix $prefix already exists"
#     return 1
#   fi
#   if [[ $fileExists = "y" ]]; then
#     echo "Creating a new environment from: $envFile"
#     conda env create --prefix $prefix --file $envFile
#   else
#     echo "Creating a new environment with arguments: $@"
#     conda create --prefix $prefix pip $@
#   fi
#   conda activate $prefix
# elif [[ "$action" = "update" ]]; then
#   echo "Updating environment: $envFile -> $prefix"
#   conda env update --prefix $prefix -f $envFile --prune
# elif [[ "$action" = "add" ]]; then
#   if [[ "$pip" = "y" ]]; then
#     echo "Installing (using pip): $@"
#     $prefix/bin/python -m pip install $@
#     for dep in $@
#     do
#       echo $dep >> $pipFile
#     done
#   else
#     echo "Installing: $@"
#     conda install --prefix $prefix $@
#   fi
# elif [[ "$action" = "remove" ]]; then
#   if [[ "$pip" = "y" ]]; then
#     echo "Uninstalling (using pip): $@"
#     $prefix/bin/python -m pip uninstall $@
#     for dep in $@
#     do
#       sed '/^$@/ d' $pipFile > $pipFile
#     done
#   else
#     echo "Uninstalling: $@"
#     conda remove --prefix $prefix $@
#   fi
# fi
#
# # conda activate $prefix
# echo "name: cenv" > $envFile
# conda env export --prefix ./env --from-history | sed '1d;/^$/d' | sed '$d' >> $envFile
# if [[ -e "$pipFile" ]]; then
#   echo "  - pip:" >> $envFile
#   echo "    - -r requirements.txt" >> $envFile
# fi
# conda env export --prefix ./env > $lockFile
#
# }
