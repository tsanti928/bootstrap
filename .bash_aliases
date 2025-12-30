alias ll='ls -ialhG --color=auto'
alias ls='ls -G --color=auto'
alias l='less'
alias v='vim'
alias p='pwd'
alias h='history'
alias pop='popd'
alias sdirs='dirs -v'
alias cdirs='dirs -c'
alias showbinds='bindkey'
alias showports='lsof -i -P -n'
alias stracev='strace -f -yy --decode-pids=pidns -Y -v $*'
alias stracevnof='strace -yy --decode-pids=pidns -Y -v $*'
alias sudo='sudo ' # Force expansion of an alias following 'sudo'.
alias gotmux='tmux attach -t session || tmux new -s session'

export GREP_OPTIONS='--color=auto'
export EDITOR=vim

pcopy() {
    local buffer
    # Read from stdin or arguments
    if [[ $# -eq 0 ]]; then
        buffer=$(base64 | tr -d '\n')
    else
        buffer=$(echo -n "$@" | base64 | tr -d '\n')
    fi

    # Output the OSC 52 sequence
    # \e]52;  -> OSC 52 header
    # c;      -> Use the "clipboard" selection
    # \a      -> BEL (String Terminator)
    printf "\e]52;c;%s\a" "$buffer"
}

# Ensure that Ctrl+s and Ctrl+r to cycle through history works.
stty -ixon
