# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt append_history autocd extended_glob share_history correct nonomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export TERM=screen-256color-bce

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Git-related information
# See <https://git-scm.com/book/en/v2/Git-in-Other-Environments-Git-in-Zsh>
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
#RPROMPT=\$vcs_info_msg_0_
PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

# Prompt
# ------
# Right prompt shows current directory (%~ means it prints ~ instead of whole path for $HOME dir)
RPROMPT="[%~]"

# Key binding
# -----------
# With this, typing the beginning of a command in history, then Up arrow will
# show the previously input commands starting with that.

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

# aliases
alias ls="ls --color=auto"
alias ll="ls -lah"

# exports

# set PATH so it includes user's local bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# source additional stuff from a personal zshrc if it exists
if [ -f "$HOME/.zshrc-$USER" ] ; then
    source "$HOME/.zshrc-$USER"
fi
