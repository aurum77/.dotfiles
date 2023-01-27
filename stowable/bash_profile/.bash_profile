[[ -f ~/.bashrc ]] && . ~/.bashrc

# Add flutter to PATH
export PATH="$PATH:$HOME/.apps/flutter/bin"
# Add pip programs to path
export PATH="$PATH:$HOME/.local/bin/"
# Add ruby gems to path
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
# Add symlinks to path
export PATH="$PATH:$HOME/.symlinks/"
# Add dotnet binaries to path
PATH="$PATH:$HOME/.dotnet/tools"
# Needed for webrtc wayland screenshare
export XDG_CURRENT_DESKTOP=sway
# Needed for Intellij to work properly
export _JAVA_AWT_WM_NONREPARENTING=1
# Enable firefox wayland
export MOZ_ENABLE_WAYLAND=1
# Only show the last 3 directories on the path prompt
export PROMPT_DIRTRIM=3
# Download go modules to somewhere acceptable
export GOPATH=$HOME/.go
# fzf config
export FZF_DEFAULT_OPTS=" \
--height 100% \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

# Start ssh-agent if it's not running
if ! pgrep ssh-agent 1> /dev/null;
  then
    # Start ssh-agent
    eval $(ssh-agent) > /dev/null 2>&1
fi

# Start sway if tty1 is used for login
if [[ "$(tty)" == "/dev/tty1" ]]
  then
    exec sway
fi
