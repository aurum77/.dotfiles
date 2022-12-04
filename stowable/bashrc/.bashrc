# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1="\[\033[1;34m\]\w \[\033[0;36m\]\$( git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git:\1) /')\A\n\[\033[00m\]\[\033[1;32m\]$\[\033[0;00m\] "

# Aliases
alias sudo='sudo '
alias l='exa'
alias ls='exa'
alias la='exa -a'
alias ll='exa -la'
alias tree='exa --tree'
alias v='nvim'
alias vc='nvim $HOME/.config/nvim'
alias c='clear'

# git specific aliases
alias ga='git add '
alias gd='git diff '
alias gds='git diff --staged'
alias gcl='git clone '
alias gcm='git commit -m '
alias gl='git log '
alias glo='git log --oneline'
alias gst='git status '

# termbin pastebin
alias tb="nc termbin.com 9999"

# Dotnet code generator
alias dac="dotnet-aspnet-codegenerator "

# Set governor
alias powersave="sudo cpupower frequency-set --governor powersave 2 > /dev/null"
alias performance="sudo cpupower frequency-set --governor performance 2 > /dev/null"

# Enables directory change without using cd
shopt -s autocd

# Source fzf config
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash 
