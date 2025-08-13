#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ $(tty) == /dev/tty1 && -z $WAYLAND_DISPLAY && -z $DISPLAY ]]; then
    read -p "Launch Hyprland? [Y/n]: " answer
    case "$answer" in
        [nN]|[nN][oO])
            ;; # Do nothing, stay in shell
        *)
            test ! -f ~/.config/waypaper/config.ini && cp ~/.config/waypaper/config.example.ini ~/.config/waypaper/config.ini
            test ! -f ~/.config/hypr/settings.conf && cp ~/.config/hypr/settings.example.conf ~/.config/hypr/settings.conf
            test ! -f ~/.config/hypr/rules.conf && cp ~/.config/hypr/rules.example.conf ~/.config/hypr/rules.conf
            test ! -f ~/.config/hypr/monitors.conf && touch ~/.config/hypr/monitors.conf
            test ! -f ~/.config/hypr/workspaces.conf && touch ~/.config/hypr/workspaces.conf
            exec Hyprland
            ;;
    esac
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
