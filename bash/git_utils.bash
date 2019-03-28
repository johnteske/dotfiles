#!/bin/bash

# Git completion
[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash

__jt_git_branch () {
    git rev-parse --abbrev-ref HEAD 2> /dev/null
}

gp () {
    local tmp="./TMP_GIT_PUSH"
    git push 2>&1 | tee "$tmp"

    # If git suggests to push and set upstream, give a choice to run
    push_set="git push --set-upstream origin $(__jt_git_branch)"
    if grep -q "${push_set}" "$tmp"; then
        local answer
        echo -n "Push and set the remote as upstream? [y/N] "
        read -r answer
        if [[ $answer == "y" ]] || [[ $answer == "Y" ]]; then
            $push_set
        fi
     fi
     rm "$tmp"
}

git-select () {
    git for-each-ref --format="%(refname:short)" refs/heads/\* | \
    grep -v "master\|$(__jt_git_branch)" | \
    while read -r line; do
        read -rp "Select branch: $line? [y/N] " answer </dev/tty;
        case "$answer" in
            y|Y) echo "$line";;
        esac;
    done
}
