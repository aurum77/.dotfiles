# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1="\[\033[1;34m\]\w \[\033[0;36m\]\$( git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git:\1) /')\n\[\033[00m\]\[\033[1;32m\]$\[\033[0;00m\] "

# Aliases
alias sudo='sudo '	# for sudo use with other aliases if needed
alias l='exa'		# needs exa
alias ls='exa'
alias la='exa -a'
alias ll='exa -la'
alias tree='exa --tree'
alias v='vim'
alias c='clear'

# git specific aliases
alias ga='git add '
alias gd='git diff '
alias gc='git commit '
alias gl='git log '
alias gst='git status '

# Enables directory change without using cd
shopt -s autocd
