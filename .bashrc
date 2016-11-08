# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return ;;
esac

case "$TERM" in
    xterm*) export TERM="xterm-256color" ;;
    screen*) export TERM="screen-256color" ;;
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
pathprepend ~/.cargo/bin

if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_TTY" ]; then
    read SSH_CLIENT_IP SSH_CLIENT_PORT SSH_SERVER_IP SSH_SERVER_PORT \
        <<< $SSH_CONNECTION
    SESSION_TYPE=remote
else
    SESSION_TYPE=local
fi

if which tmux >/dev/null 2>&1 && [ -z "$TMUX" ]; then
    if tmux has-session -t $SESSION_TYPE; then # no -PA in old tmux
        exec tmux attach-session -t $SESSION_TYPE
    else
        exec tmux new-session -s $SESSION_TYPE
    fi
fi

HISTCONTROL=ignorespace:ignoredups:erasedups
HISTSIZE=500000
HISTFILESIZE=100000
HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear:sync"
HISTTIMEFORMAT="%F %T "
# shorten prompt pwd
PROMPT_DIRTRIM=3
# immediately append
PROMPT_COMMAND="history -a"
# append not overwrite
shopt -s histappend
# multi-line commands as one
shopt -s cmdhist
# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null
# Allow cd-ing into variables that are defined
shopt -s cdable_vars
# defer exit when running bg jobs
shopt -s checkjobs
# where cd looks for targets
CDPATH=".:~"

# Update window size after every command
shopt -s checkwinsize

export HOSTNAME=$(hostname)
export DEBNAME="Robert Jordens"
export DEBFULLNAME="Robert Jördens"
export DEBEMAIL=jordens@gmail.com
export DEBSIGN_KEYID=4130198A64FEFBAF
export REPORTBUGEMAIL=jordens@gmail.com
export IRCNICK=rjo
export EMAIL=jordens@gmail.com

export EDITOR=vim
export PAGER=less
export LESS="--RAW-CONTROL-CHARS"

export GPG_TTY=$(tty)

if [ "$SESSION_TYPE" = "local" ]; then
    # gpg-agent doesn't do ssh-agent forwarding, needs explicit start and env
    # setting
    if which gpg-connect-agent >/dev/null 2>&1 && \
        gpg-connect-agent /bye >/dev/null 2>&1; then
        export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    fi
else
    if [ -S "$SSH_AUTH_SOCK" ]; then
        ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock_${SSH_CLIENT_IP}_${HOSTNAME}
    fi
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock_${SSH_CLIENT_IP}_${HOSTNAME}
fi

source ~/.bash_colors.sh

source ~/.bash_aliases.sh

if [ -x /usr/bin/lesspipe ]; then
    eval "$(SHELL=/bin/sh lesspipe)"
fi

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
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
  complete -C aws_completer aws
fi

# vim: et ts=4 sw=4
