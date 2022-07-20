[[ -f ~/.bashrc ]] && . ~/.bashrc

# Add flutter to PATH
export PATH="$PATH:$HOME/.apps/flutter/bin"
# Add pip programs to path
export PATH="$PATH:$HOME/.local/bin/"
# Add ruby gems to path
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
# Add symlinks to path
export PATH="$PATH:$HOME/.symlinks/"
# Needed for webrtc wayland screenshare
export XDG_CURRENT_DESKTOP=sway
# Needed for Intellij to work properly
export _JAVA_AWT_WM_NONREPARENTING=1
# Only show the last 3 directories on the path prompt
export PROMPT_DIRTRIM=3
# Add java to path if installed
if [[ -f /etc/profile.d/jre.sh ]];
  then
    source /etc/profile.d/jre.sh
fi

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
