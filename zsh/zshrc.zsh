[[ -f ~/.bashrc ]] && . ~/.bashrc

PROMPT='%U%1~ %#%u '

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{black}%b%f'
#zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

#RPROMPT='%(?.%F{green}OK.%F{red}NO)%f'
fpath+=${ZDOTDIR:-~}/.zsh_functions
