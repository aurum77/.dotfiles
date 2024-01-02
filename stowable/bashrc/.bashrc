# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1="\[\033[1;34m\]\w \[\033[0;36m\]\$( git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git:\1) /')\n\[\033[00m\]\[\033[1;32m\]$\[\033[0;00m\] "

# Aliases
alias sudo='sudo '
alias l='eza'
alias ls='eza'
alias la='eza -a'
alias ll='eza -la'
alias tree='eza --tree'
alias v='nvim '
alias vc='nvim $HOME/.config/nvim '
alias c='clear'
alias z='zathura '

# git specific aliases
alias ga='git add '
alias gd='git diff '
alias gds='git diff --staged '
alias gcl='git clone '
alias gcm='git commit -m '
alias gl='git log '
alias glo='git log --oneline '
alias gst='git status '
alias gp='git push '
alias s="kitten ssh"

# Set governor
alias powersave="sudo cpupower frequency-set --governor powersave 2 > /dev/null"
alias schedutil="sudo cpupower frequency-set --governor schedutil 2 > /dev/null"
alias performance="sudo cpupower frequency-set --governor performance 2 > /dev/null"

# Enables directory change without using cd
shopt -s autocd

# Source fzf config
source /usr/share/fzf/key-bindings.bash
