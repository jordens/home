function grepl() {
    grep --color=always "$@" | less -R
}

function lsl() {
    ls --color=always "$@" | less -R
}

alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias lll='lsl -alF'
alias lal='lsl -A'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias unix2dos='recode lat1..ibmpc'
alias dos2unix='recode ibmpc..lat1'
