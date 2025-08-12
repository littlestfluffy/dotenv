#!/usr/bin/env bash
# mpvpaper-control.sh
# Usage:
#   ./mpvpaper-control.sh start path/to/video.mp4
#   ./mpvpaper-control.sh pause
#   ./mpvpaper-control.sh resume
#   ./mpvpaper-control.sh stop

SOCKET="/tmp/mpvpaper.sock"
VIDEO="$2"

send_command() {
    local cmd="$1"
    if [ -S "$SOCKET" ]; then
        echo "$cmd" | socat - "$SOCKET" >/dev/null
    else
        echo "Error: mpvpaper socket not found. Is it running?"
        exit 1
    fi
}

case "$1" in
    start)
        if [ -z "$VIDEO" ] || [ ! -f "$VIDEO" ]; then
            echo "Usage: $0 start path/to/video.mp4"
            exit 1
        fi
        pkill -x mpvpaper 2>/dev/null
        nohup mpvpaper -l bottom -po "no-audio loop --input-ipc-server=$SOCKET" ALL "$VIDEO" >/dev/null 2>&1 &
        echo "mpvpaper started with video: $VIDEO"
        ;;
    pause)
        send_command '{ "command": ["set_property", "pause", true] }'
        echo "mpvpaper paused."
        ;;
    resume)
        send_command '{ "command": ["set_property", "pause", false] }'
        echo "mpvpaper resumed."
        ;;
    toggle)
        send_command 'cycle pause'
        echo "mpvpaper status toggled."
        ;;
    stop)
        pkill -x mpvpaper && echo "mpvpaper stopped." || echo "mpvpaper not running."
        ;;
    *)
        echo "Usage: $0 <start|pause|resume|stop> [path/to/video.mp4]"
        exit 1
        ;;
esac
