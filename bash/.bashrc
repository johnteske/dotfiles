# LOAD
for file in ~/.{aliases,prompt,git_utils,bashrc.linux,bash_local}; do
    [ -r "$file" ] && source "$file"
done; unset file

# EDITOR
export VISUAL=vim
export EDITOR="$VISUAL"

# HELPERS
download_to_file () {
    if command -v wget; then
        wget "$1" -O "$2"
    elif command -v curl; then
        curl "$1" -o "$2"
    else
        echo "Unable to download. wget and curl are not installed."
    fi
}

