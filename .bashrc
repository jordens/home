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

pathappend() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

pathprepend() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1${PATH:+":$PATH"}"
    fi
}

pathappend ~/bin
pathprepend ~/.local/bin
for i in ~/.gem/ruby/*/bin; do
    pathprepend "$i"
done

if which tmux >/dev/null 2>&1; then
    if [ -z "$TMUX" ]; then
        if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
            _tmux_type=remote
        else
            _tmux_type=local
        fi
        if tmux has-session -t $_tmux_type; then # no -PA in old tmux
            exec tmux attach-session -t $_tmux_type
        else
            exec tmux new-session -s $_tmux_type
        fi
    fi
fi

HISTCONTROL=ignorespace:ignoredups:erasedups
HISTSIZE=10000
HISTFILESIZE=10000
shopt -s histappend

shopt -s checkwinsize

if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

export DEBNAME="Robert Jordens"
export DEBFULLNAME="Robert Jördens"
export DEBEMAIL=jordens@gmail.com
export DEBSIGN_KEYID=E02FEF11
export REPORTBUGEMAIL=jordens@gmail.com
export IRCNICK=rjo
export EMAIL=jordens@gmail.com

export EDITOR=vim
export PAGER=less
export LESS="--RAW-CONTROL-CHARS"

. ~/bin/bash_colors.sh

. ~/bin/bash_aliases.sh

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -x /usr/bin/dircolors ]; then
    if [ -f ~/.dircolors ]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
fi

#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWUNTRACKEDFILES=1
#export GIT_PS1_SHOWSTASHSTATE=1

PS1="\[$BRIGHT_GREEN\]\u@\h\[$NORMAL\]:\[$BRIGHT_BLUE\]\w\[$BRIGHT_VIOLET\]\$(__git_ps1)\[$NORMAL\]\\$ "

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# vim: et ts=4 sw=4
