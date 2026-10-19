# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1="\[\033[1;34m\]\w \[\033[0;36m\]\$( git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /')\n\[\033[00m\]\[\033[1;32m\]$\[\033[0;00m\] "

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
alias t='tmux '

# git specific aliases
alias ga='git add '
alias gd='git diff '
alias gds='git diff --staged '
alias grs='git restore --staged '
alias gcl='git clone '
alias gcm='git commit -m '
alias gl='git log '
alias glo='git log --oneline '
alias gst='git status '
alias gp='git push '

# Enables directory change without using cd
shopt -s autocd

# Source fzf config
source /usr/share/fzf/key-bindings.bash

# Create a numbered tmux session
new-tmux() {
  local next=1
  local last

  last=$(tmux list-sessions -F '#{session_name}' 2>/dev/null |
    awk '/^[0-9]+$/ { if ($0 > max) max = $0 } END { print max }')

  if [[ -n "$last" ]]; then
    next=$((last + 1))
  fi

  exec tmux new-session -s "$next"
}

# Auto-start tmux in interactive terminals
if [[ $- == *i* ]] && command -v tmux >/dev/null 2>&1; then
  if [[ -z "$TMUX" && -t 0 && -t 1 && "$(tty)" != /dev/tty* ]]; then
    new-tmux
  fi
fi
