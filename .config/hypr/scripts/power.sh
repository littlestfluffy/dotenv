
options=$(cat <<EOF
Shutdown\0icon\x1fsystem-shutdown
Reboot\0icon\x1fsystem-reboot
Log Out\0icon\x1fsystem-log-out
Sleep\0icon\x1fsystem-suspend
Lock\0icon\x1fsystem-lock-screen
EOF
)

choice=$(printf "$options" | rofi -dmenu -theme "power-menu" -hide-scrollbar)

case "$choice" in
	"Shutdown"    ) shutdown now ;;
	"Reboot"      ) reboot ;;
	"Log Out"     ) hyprctl dispatch exit ;;
  "Sleep"       ) systemctl suspend ;;
  "Lock"        ) loginctl lock-session ;;
esac
