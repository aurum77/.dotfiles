# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias l='lsd'     # needs lsd
alias ls='lsd'     # needs lsd
alias la='lsd -a'     # needs lsd
alias ll='lsd -la'     # needs lsd
alias v='nvim'     # needs nvim
alias c='clear'
alias sudo='sudo ' # for sudo use with other aliases if needed

PS1="\n\[\033[0;36m\]\u\[\033[0;31m\]@\[\033[0;32m\]\h \[\033[0;35m\]\$( git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git:\1) /')\n\[\033[1;33m\]\w\[\033[00m\] \[\033[1;33m\]>\[\033[0;00m\] "

# enables directory change without using cd
shopt -s autocd
