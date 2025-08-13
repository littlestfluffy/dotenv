
options=$(cat <<EOF
Power off\0icon\x1fsystem-shutdown
Reboot\0icon\x1fsystem-reboot
Log out\0icon\x1fsystem-log-out
EOF
)

choice=$(printf "$options" | rofi -dmenu -theme "power-menu" -hide-scrollbar)

case "$choice" in
	"Power off"        ) echo shutdown now ;;
	"Reboot"        ) echo reboot ;;
	"Log out"        ) echo hyprctl dispatch exit ;;
esac
