#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Needed for pipewire-media-session webrtc wayland screenshare
# needs this enabled in chrome chrome://flags/#enable-webrtc-pipewire-capturer
export XDG_CURRENT_DESKTOP=sway
# Needed for intellij to work properly
export _JAVA_AWT_WM_NONREPARENTING=1

[[ $XDG_VTNR -le 2 ]] && tbsm
