#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# load fish if installed (preferred shell)
if command -v fish &> /dev/null; then
  fish
  exit $?
fi

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
