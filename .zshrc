[[ -f ~/.bashrc ]] && . ~/.bashrc

zstyle ':completion:*:*:git:*' script ~/.git-completion.zsh

# vi mode
bindkey -v

export KEYTIMEOUT=1 # in tenths of a second

function zle-line-init zle-keymap-select {
  case ${KEYMAP} in
    (vicmd)  PROMPT_STYLE='%S' ;; # add standout
    (*)      PROMPT_STYLE='' ;;
  esac

  PROMPT="$PROMPT_STYLE%U%1~ %#%u%s "

  RPS1=""
  RPS1+="$EPS1"

  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

autoload -U add-zsh-hook
refresh-tmux() {
  [ -n "$TMUX" ] && tmux refresh-client -S
}
add-zsh-hook chpwd refresh-tmux
