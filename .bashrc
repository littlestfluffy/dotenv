#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if command -v uwsm &> /dev/null && uwsm check may-start && uwsm select; then
  test ! -f "${HOME}/.config/hypr/settings.conf" && cp "${HOME}/.config/hypr/settings.example.conf" "${HOME}/.config/hypr/settings.conf"
  exec systemd-cat -t uwsm_start uwsm start default
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
