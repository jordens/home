# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

case "$TERM" in
    xterm*)
        export TERM="xterm-256color"
    ;;
esac

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

pathadd /usr/local/bin
pathadd ~/bin

if which tmux >/dev/null 2>&1; then
    if [ -z "$TMUX" ]; then # could exec here
        tmux attach-session || tmux new-session
    fi
fi

HISTCONTROL=ignorespace:ignoredups:erasedups
HISTSIZE=10000
HISTFILESIZE=10000
shopt -s histappend

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
export GREP_OPTIONS="--color=auto"

. ~/bin/bash_aliases.sh
. ~/bin/bash_colors.sh
. ~/bin/git-completion.sh
. ~/bin/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1

PS1="\[$BRIGHT_GREEN\]\u@\h\[$NORMAL\]:\[$BRIGHT_BLUE\]\w\[$NORMAL\]\\$ "

export DEBNAME="Robert Jordens"
export DEBFULLNAME="Robert Jördens"
export DEBEMAIL=jordens@gmail.com
export DEBSIGN_KEYID=E02FEF11
export REPORTBUGEMAIL=jordens@gmail.com
export IRCNICK=rjo
export EMAIL=jordens@gmail.com

export EDITOR=vim
export PAGER=less

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# vim: et ts=4 sw=4
