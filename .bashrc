# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignorespace:ignoredups:erasedups
HISTSIZE=10000
HISTFILESIZE=10000
shopt -s histappend

shopt -s checkwinsize

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}
pathadd /usr/local/bin
pathadd ~/bin

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export TERM="xterm-256color"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
export GREP_OPTIONS="--color=auto"

. ~/bin/bash_aliases.sh
. ~/bin/bash_colors.sh
. ~/bin/git-completion.bash

export GIT_PS1_SHOWDIRTYSTATE=1

PS1="\[$BRIGHT_GREEN\]\u@\h\[$RESET\]:\[$BRIGHT_BLUE\]\w\[$BRIGHT_VIOLET\]$(__git_ps1 " (%s)")\[$RESET\]\\$ "

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
