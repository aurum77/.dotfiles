# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias l='exa'		# needs exa
alias ls='exa'		# needs exa
alias la='exa -a'	# needs exa
alias ll='exa -la'	# needs exa
alias tree='exa --tree' # needs exa
alias v='nvim'     # needs nvim
alias c='clear'
alias sudo='sudo ' # for sudo use with other aliases if needed

PS1="\n\[\033[0;36m\]\u\[\033[0;31m\]@\[\033[0;32m\]\h \[\033[0;35m\]\$( git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git:\1) /')\n\[\033[1;33m\]\w\[\033[00m\] \[\033[1;33m\]>\[\033[0;00m\] "

# enables directory change without using cd
shopt -s autocd
