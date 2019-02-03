#!/bin/bash

INSTALL_ENV=$1

make_bak () {
    [ -f "$1" ] && mv "$1" "$1.bak"
}

try_bak_lns () {
    make_bak "$1" && ln -s "$2" "$1"
}

try_bak_lns ~/.bashrc ~/dotfiles/bash/.bashrc
try_bak_lns ~/.aliases ~/dotfiles/bash/.aliases
try_bak_lns ~/.git_utils ~/dotfiles/bash/.git_utils

if [ "$INSTALL_ENV" == "linux" ]; then
    try_bak_lns ~/.bashrc.linux ~/dotfiles/bash/bashrc.linux && \
    source ~/.bashrc
fi

if [ "$INSTALL_ENV" == "osx" ]; then
    try_bak_lns ~/.bash_profile ~/dotfiles/bash/.bash_profile.osx && \
    source ~/.bash_profile
fi

#if [ ! -f ~/.git-completion.bash ]; then
#    echo -n "Install git completion? [Y/n] "; read answer
#    if [[ $answer != "n" ]] && [[ $answer != "N" ]]; then
#        download_to_file https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash ~/.git-completion.bash && source ~/.git-completion.bash
#    fi
#fi
