[[ -f ~/.bashrc ]] && . ~/.bashrc

PROMPT='%U%1~ %#%u '

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{black}%b%f'
zstyle ':vcs_info:*' enable git

#RPROMPT='%(?.%F{green}OK.%F{red}NO)%f'

fpath+=${ZDOTDIR:-~}/.zsh_functions

# vi mode
bindkey -v

export KEYTIMEOUT=1 # in tenths of a second

function zle-line-init zle-keymap-select {
  VIM_PROMPT='%F{green}[% NORMAL]% %b%f'
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $vcs_info_msg_0_ $EPS1"
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
