# LOAD

for file in ~/dotfiles/bash/.{aliases,git_utils,bash_local}; do
    [ -r "$file" ] && source "$file"
done
unset file

# PROMPT

parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

display_git_branch () {
    local BRANCH=$(parse_git_branch)
    [[ ! -z $BRANCH ]] && echo ":$BRANCH"
}

PS1="\u:\W\$(display_git_branch)\$ "

# HELPERS

download_to_file () {
    if command -v wget; then
        wget "$1" -O "$2"
    elif command -v curl; then
        curl "$1" -o "$2"
    else
        echo "Unable to download. wget and curl not installed."
    fi
}

