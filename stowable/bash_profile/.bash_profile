#
# ~/.bash_profile, executed on login
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Add flutter to PATH
export PATH="$PATH:$HOME/.apps/flutter/bin"
# Add pip programs to path
export PATH="$PATH:$HOME/.local/bin/"
# Needed for pipewire-media-session webrtc wayland screenshare
# needs this enabled in chrome chrome://flags/#enable-webrtc-pipewire-capturer
export XDG_CURRENT_DESKTOP=sway
# Needed for Intellij to work properly
export _JAVA_AWT_WM_NONREPARENTING=1
# Needed for Flutter framework
export CHROME_EXECUTABLE=google-chrome-stable
# Only show the last 3 directories on the path prompt
export PROMPT_DIRTRIM=3


# Start ssh-agent if it's not running
if ! pgrep ssh-agent;
  then
    # Start ssh-agent
    eval $(ssh-agent)
fi

# Start sway if tty1 is used for login and start logging
if [[ "$(tty)" == "/dev/tty1" ]]
  then
    exec sway --verbose 2> /tmp/sway.log
fi
