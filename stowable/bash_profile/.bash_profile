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
export FZF_DEFAULT_OPTS="
--height 100% \
--color=bg+:#3c3836,bg:#282828,spinner:#fabd2f,hl:#fabd2f \
--color=fg:#ebdbb2,header:#665c54,info:#83a598,pointer:#83a598 \
--color=marker:#fe8019,fg+:#ebdbb2,prompt:#bdae93,hl+:#fabd2f"

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
