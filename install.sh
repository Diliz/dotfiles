#!/usr/bin/env bash

DEPENDENCIES="git ansible"

function install_dependencies () {
   declare -A package_managers=([apt]="apt install -y" [yum]="yum install -y" [pacman]="pacman -Sy")
   for package_manager in ${!package_managers[@]};do
       if [[ -z $(command -v $package_manager) ]]; then
           echo "Package manager not available"
       else
           eval $(echo sudo ${package_managers[$package_manager]} ${DEPENDENCIES})
       fi
   done
   return 0
}

function install_dotfiles () {
    DOTFILES_PATH="$HOME/.dotfiles"
    if [ -d "$DOTFILES_PATH" ]; then
        cd $DOTFILES_PATH
        git pull origin main
    else
        git clone https://github.com/Diliz/dotfiles.git $DOTFILES_PATH
        cd $DOTFILES_PATH
    fi
    ansible-galaxy collection install -r requirements.yml
    ANSIBLE_BECOME_PASSWORD=toto ansible-playbook dotfiles.yml
}

function install () {
    install_dependencies
    install_dotfiles
    return 0
}

# echo "Install dotfiles?"
# select answer in "Yes" "No"; do
#     case $answer in
#         "Yes" ) install; break;;
#         "No" ) exit;;
#     esac
# done

install
