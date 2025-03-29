[[ -f ~/.bashrc ]] && . ~/.bashrc

# Add pip programs to path
export PATH="$PATH:$HOME/.local/bin/"
# Add symlinks to path
export PATH="$PATH:$HOME/.symlinks/"
# Add dotnet binaries to path
export PATH="$PATH:$HOME/.dotnet/tools/"
# Add dotnet itself to path
export PATH="$PATH:$HOME/.dotnet/"
# Add go binaries to path
export PATH="$PATH:$HOME/.go/bin/"
# JetBrains toolbox
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts/"

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
# Set editor
export EDITOR=/usr/bin/nvim
# Set Android sdk path
export ANDROID_HOME=$HOME/.android_sdk
# Set npm package path
export NPM_PACKAGES=$HOME/.npm_packages
# fzf config
export FZF_DEFAULT_OPTS="
--height 100% \
--reverse \
--color=bg+:#3c3836,bg:#282828,spinner:#fabd2f,hl:#fabd2f \
--color=fg:#ebdbb2,header:#665c54,info:#83a598,pointer:#83a598 \
--color=marker:#fe8019,fg+:#ebdbb2,prompt:#bdae93,hl+:#fabd2f"

export PATH="$PATH:$NPM_PACKAGES/bin"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Start ssh-agent if it's not running
if ! pgrep ssh-agent 1>/dev/null; then
  # Start ssh-agent
  eval $(ssh-agent) >/dev/null 2>&1
fi

# Start sway if tty1 is used for login
if [[ "$(tty)" == "/dev/tty1" ]]; then
  exec sway
fi
