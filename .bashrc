#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if command -v uwsm &> /dev/null && uwsm check may-start && uwsm select; then
  test ! -f ~/.config/hypr/settings.conf && cp ~/.config/hypr/settings.example.conf ~/.config/hypr/settings.conf
  test ! -f ~/.config/hypr/monitors.conf && touch ~/.config/hypr/monitors.conf
  exec systemd-cat -t uwsm_start uwsm start hyprland-uwsm.desktop
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
