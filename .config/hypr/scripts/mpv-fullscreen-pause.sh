##!/usr/bin/env bash
# mpv-fullscreen-pause.sh
# Pauses all MPV instances when fullscreen is active, resumes otherwise.
# Usage from hyprhook:
#   activeWindow = /path/to/mpv-fullscreen-pause.sh '<json_window_data>'

echo "test $(date)" > /tmp/debug

window_json="$(hyprctl -j activewindow)"

if [ -z "$window_json" ]; then
    echo "Usage: $0 '<json_window_data>'"
    exit 1
fi

# Extract fullscreen state from JSON
fullscreen=$(echo "$window_json" | jq '.fullscreen')

# Decide pause value based on fullscreen state
if [ "$fullscreen" -ne 0 ]; then
    cmd='{ "command": ["set_property", "pause", true] }'
else
    cmd='{ "command": ["set_property", "pause", false] }'
fi

# Send command to all matching MPV sockets
for s in /tmp/mpv-socket-*; do
    if [ -S "$s" ]; then
        echo "$cmd" | socat - "$s" >/dev/null
    fi
done
