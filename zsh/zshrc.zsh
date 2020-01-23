[[ -f ~/.bashrc ]] && . ~/.bashrc

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{black}%b%f'
zstyle ':vcs_info:*' enable git

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
  RPS1+="$vcs_info_msg_0_"
  RPS1+="$EPS1"

  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
