#!/bin/bash

display_filtered_user () {
    local u
    u=$(whoami)
    case $u in
        johnteske) u="" ;;
        *) u="$u:" ;;
    esac
    echo $u
}

parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

display_git_branch () {
    local BRANCH
    BRANCH=$(parse_git_branch)
    [[ -n $BRANCH ]] && echo ":$BRANCH"
}

test_status () {
    local TEST_STATUS_PATH
    TEST_STATUS_PATH="$(git rev-parse --show-toplevel 2> /dev/null)/.teststatus"
    if [ -f "$TEST_STATUS_PATH" ]; then
        read -r -n 1 STATUS < "$TEST_STATUS_PATH"
        echo "$STATUS"
    fi
}

display_test_status () {
    local STATUS
    STATUS=$(test_status)

    local STATUS_CHAR
    if [[ -n $STATUS ]]; then
        case $STATUS in
            0) STATUS_CHAR="+" ;;
            1) STATUS_CHAR="-" ;;
            *)  STATUS_CHAR="?" ;;
        esac
        echo ":$STATUS_CHAR"
    fi
}

PS1="$(display_filtered_user)\W\$(display_git_branch)\$(display_test_status)\$ "