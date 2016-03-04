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
# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000
# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
# Useful timestamp format
HISTTIMEFORMAT='%F %T '
# Append to the history file, don't overwrite it
shopt -s histappend
# Save multi-line commands as one command
shopt -s cmdhist
# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'
# Record each line as it gets issued
PROMPT_COMMAND='history -a'
# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null
# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH="."

# Update window size after every command
shopt -s checkwinsize

## SMARTER TAB-COMPLETION (Readline bindings) ##
# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"
# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"
# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"


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

. ~/.bash_colors.sh

. ~/.bash_aliases.sh

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
