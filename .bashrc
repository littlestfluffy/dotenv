#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if command -v uwsm &> /dev/null && uwsm check may-start && uwsm select; then
  exec systemd-cat -t uwsm_start uwsm start default
fi

# load fish if installed (preferred shell)
if command -v fish &> /dev/null; then
  fish
  exit $?
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

