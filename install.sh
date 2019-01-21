#!/bin/bash

mv ~/.bashrc ~/.bashrc.bak
ln -s ~/dotfiles/bash/.bashrc ~/.bashrc

source ~/.bashrc

#if [ ! -f ~/.git-completion.bash ]; then
#    echo -n "Install git completion? [Y/n] "; read answer
#    if [[ $answer != "n" ]] && [[ $answer != "N" ]]; then
#        download_to_file https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash ~/.git-completion.bash && source ~/.git-completion.bash
#    fi
#fi
