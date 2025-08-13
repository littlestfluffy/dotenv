#!/usr/bin/env bash
set -euo pipefail

list_dir="${LIST_DIR:-$HOME/.config/webapp}"
launcher="${1:-xdg-open}"
app="${2-}"

case "${app-}" in
  "")
    for list_file in "$list_dir"/*; do
        [[ -f "$list_file" ]] || continue
        while IFS='|' read -r name url icon; do
            [[ -n "${name:-}" && -n "${url:-}" && -n "${icon:-}" ]] || continue
            printf "%s\0icon\x1f%s\n" "$name" "$icon"
        done < "$list_file"
    done
    ;;
  *)
    # Selection: find URL for exact name match and open it
    sel="${app}"
    url=""
    for list_file in "$list_dir"/*; do
        [[ -f "$list_file" ]] || continue
        while IFS='|' read -r name url_field icon; do
            [[ "$name" == "$sel" ]] || continue
            url="$url_field"
            break 2  # stop both loops once found
        done < "$list_file"
    done
    if [[ -n "$url" ]]; then
        if [[ "$launcher" == *= ]]; then
            # No space, append directly
            cmd="${launcher}${url}"
            eval "nohup $cmd >/dev/null 2>&1 &"
        else
            # Space-separated argument
            nohup $launcher "$url" >/dev/null 2>&1 &
        fi
    fi
    ;;
esac
