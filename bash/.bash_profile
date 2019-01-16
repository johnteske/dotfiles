for file in ~/.{aliases,bash_local}; do
    [ -r "$file" ] && source "$file"
done
unset file

# FINDER-TERMINAL HELPERS
if [[ "$OSTYPE" == "darwin"* ]]; then
    ## cd to the current directory active in the Finder
    cdf () {
        local currFolderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }

    ## copy the current Finder path to the clipboard
    cpf () {
        local currFinderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                set finderSelList to selection as alias list
            end tell

            if finderSelList ≠ {} then
                repeat with i in finderSelList
                    set contents of i to POSIX path of (contents of i)
                end repeat

                set AppleScript's text item delimiters to linefeed
                # ' single quote comment needed
                finderSelList as text
            end if
EOT
        )
        echo "$currFinderPath" | pbcopy
        echo "$currFinderPath"
    }
fi

# GIT AUTO COMPLETION

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
else
    echo "Git completion not found. Fetching..."
    curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash && source ~/.git-completion.bash && echo "Git completion added."
fi

# PROMPT

## Parse git branch
function parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

## Set custom prompt
PS1="jt:\\W\$(parse_git_branch)\$ "

download_to_file () {
    if command -v wget; then
        wget "$1" -O "$2"
    elif command -v curl; then
        curl "$1" -o "$2"
    else
        echo "Unable to download. wget and curl not installed."
    fi
}

git-select () {
    # TODO also exclude current branch?
    git for-each-ref --format="%(refname:short)" refs/heads/\* | grep -v "master" | \
    while read -r line; do
        read -p "select branch: $line (y/N)?" answer </dev/tty;
        case "$answer" in
            y|Y) echo "$line";;
        esac;
    done # | xargs git branch -D
}
