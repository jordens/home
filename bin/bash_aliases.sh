function grepl() {
    grep --color=always "$@" | less -R
}

function lsl() {
    ls --color=always "$@" | less -R
}

alias ls='ls -G --color=auto'
alias ll='ls -alFG --color=auto'
alias la='ls -AG --color=auto'
alias l='ls -CFG --color=auto'
alias lll='lsl -alFG --color=auto'
alias lal='lsl -AG --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
