#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if command -v uwsm &> /dev/null && uwsm check may-start && uwsm select; then
  test ! -f ~/.config/hypr/settings.conf && cp ~/.config/hypr/settings.example.conf ~/.config/hypr/settings.conf
  test ! -f ~/.config/hypr/rules.conf && cp ~/.config/hypr/rules.example.conf ~/.config/hypr/rules.conf
  test ! -f ~/.config/hypr/monitors.conf && touch ~/.config/hypr/monitors.conf
  test ! -f ~/.config/hypr/workspaces.conf && touch ~/.config/hypr/workspaces.conf
  exec systemd-cat -t uwsm_start uwsm start hyprland-uwsm.desktop
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
