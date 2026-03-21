#!/usr/bin/env bash
# break-reminder.sh
# Sends a transient warning notification, then shows a hard-to-dismiss
# fullscreen break overlay for 20 seconds.
# Designed to run as a systemd user service on a 20-minute interval.

set -euo pipefail

# ── helpers ──────────────────────────────────────────────────────────────────

# Resolve the display/dbus env from the running GNOME session.
# Needed when launched by systemd (which has no $DISPLAY).
detect_session_env() {
    local user="${USER:-$(whoami)}"
    local uid
    uid=$(id -u "$user")

    # Try common display values
    for disp in :0 :1 :2; do
        if xdpyinfo -display "$disp" &>/dev/null 2>&1; then
            export DISPLAY="$disp"
            break
        fi
    done

    # Grab DBUS_SESSION_BUS_ADDRESS from the live session
    local pid
    pid=$(pgrep -u "$uid" gnome-session 2>/dev/null | head -1 \
          || pgrep -u "$uid" "gnome-shell" 2>/dev/null | head -1 \
          || true)

    if [[ -n "$pid" ]]; then
        local dbus
        dbus=$(cat "/proc/$pid/environ" 2>/dev/null \
               | tr '\0' '\n' \
               | grep DBUS_SESSION_BUS_ADDRESS \
               | cut -d= -f2- || true)
        [[ -n "$dbus" ]] && export DBUS_SESSION_BUS_ADDRESS="$dbus"

        local xdg
        xdg=$(cat "/proc/$pid/environ" 2>/dev/null \
              | tr '\0' '\n' \
              | grep XDG_RUNTIME_DIR \
              | cut -d= -f2- || true)
        [[ -n "$xdg" ]] && export XDG_RUNTIME_DIR="$xdg"
    fi
}

# ── main ─────────────────────────────────────────────────────────────────────

detect_session_env

BREAK_SECS=20
WARN_SECS=15

# ── 1. Transient warning notification (won't stick in GNOME notification feed)
notify-send \
    --urgency=normal \
    --expire-time=$(( WARN_SECS * 1000 )) \
    --hint=int:transient:1 \
    "⏸  Break in ${WARN_SECS}s" \
    "A ${BREAK_SECS}-second pause is coming. Wrap up."

sleep "$WARN_SECS"

# ── 2. Full-screen break overlay ─────────────────────────────────────────────
# yad is preferred (lighter); fall back to zenity if absent.
# Both are told to stay on top, skip the taskbar, and ignore Escape.
# The window auto-closes after $BREAK_SECS seconds via --timeout.

if command -v yad &>/dev/null; then
    # yad: undecorated fullscreen overlay — Alt+F4 has nothing to grab,
    # Super+Q won't match because there's no WM title bar to act on.
    yad \
        --title="Break Time" \
        --text="\n\n<span font='36' weight='bold'>☕  Take a break</span>\n\n<span font='18'>Step away for ${BREAK_SECS} seconds.\nYour eyes will thank you.</span>\n" \
        --no-buttons \
        --no-escape \
        --skip-taskbar \
        --undecorated \
        --on-top \
        --fullscreen \
        --timeout="$BREAK_SECS" \
        --timeout-indicator=bottom \
        --borders=0 \
        2>/dev/null || true

elif command -v zenity &>/dev/null; then
    # zenity fallback — can't be made fully undecorated but --modal + timeout
    # at least makes it stubborn.  We wrap it in a background job and use
    # a countdown label trick via --progress.
    (
        for i in $(seq "$BREAK_SECS" -1 1); do
            echo $(( (BREAK_SECS - i) * 100 / BREAK_SECS ))
            echo "# ☕  Break time — ${i}s remaining. Step away!"
            sleep 1
        done
        echo 100
    ) | zenity \
        --progress \
        --title="Break Time" \
        --text="☕  Break time — ${BREAK_SECS}s remaining. Step away!" \
        --percentage=0 \
        --auto-close \
        --no-cancel \
        --width=500 \
        2>/dev/null || true

else
    # Last-resort: xmessage (always present on X11 systems)
    (sleep "$BREAK_SECS" && pkill -f "xmessage.*Break" 2>/dev/null) &
    xmessage \
        -center \
        -buttons "" \
        "  ☕  Break time — ${BREAK_SECS} seconds. Step away!  " \
        2>/dev/null || true
fi
