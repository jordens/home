function grepl() {
    grep --color=always "$@" | less -R
}

function lsl() {
    ls --color=always "$@" | less -R
}

function agl() {
    ag --color "$@" | less -R
}

function treel() {
    tree -C "$@" | less -R
}

function dictl() {
    dict "$@" | less
}

alias ls='ls --color=auto'
alias ll='ls -halF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -F --color=auto'
alias lll='lsl -halF'
alias lal='lsl -A'

alias grep='grep --color=auto'
alias g='grep --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias unix2dos='recode lat1..ibmpc'
alias dos2unix='recode ibmpc..lat1'
