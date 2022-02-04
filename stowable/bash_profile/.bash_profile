#
# ~/.bash_profile
#

# Add flutter to PATH
export PATH="$PATH:$HOME/.apps/flutter/bin"
# Add pip programs to path
export PATH="$PATH:$HOME/.local/bin/"
# Needed for pipewire-media-session webrtc wayland screenshare
# needs this enabled in chrome chrome://flags/#enable-webrtc-pipewire-capturer
export XDG_CURRENT_DESKTOP=sway
# Needed for Intellij to work properly
export _JAVA_AWT_WM_NONREPARENTING=1
# Enable wayland support in Firefox
export MOZ_ENABLE_WAYLAND=1
# Set terminal emulator for sway-launcher-desktop
export TERMINAL_COMMAND="xfce4-terminal -e"

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start sway if the first tty is used for login and start logging
if [[ "$(tty)" == "/dev/tty1" ]]
  then
    exec sway --verbose 2> /tmp/sway.log
fi
