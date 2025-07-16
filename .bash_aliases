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

# Ensure that Ctrl+s and Ctrl+r to cycle through history works.
stty -ixon
